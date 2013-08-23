use strict;
use warnings;

package CPAN::Changes::Markdown;

# ABSTRACT: Format your Changes file ( or a section of it ) in Markdown

use Moo 1.000008;
use CPAN::Changes::Markdown::Filter::RuleUtil qw(:all);

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown",
    "interface":"class",
    "inherits":"Moo::Object"
}

=end MetaPOD::JSON

=cut

=head1 SYNOPSIS

    use CPAN::Changes::Markdown;

    my $changes = CPAN::Changes::Markdown->load( $path_to_changes_file );

    print $changes->serialize # emits Markdown

=cut

=head1 DESCRIPTION

Mostly, this is wrapper around CPAN::Changes that just formats the output differently.

Primary use case for me is writing C<Github> release notes.

I plan to eventually have hook filters and stuff to highlight various tokens in a C<Github> friendly way.

=cut

=attr C<changes>

=cut

has changes => (
  is      => ro =>,
  lazy    => 1,
  builder => sub {
    require CPAN::Changes;
    return CPAN::Changes->new();
  },
);
has header_filter => (
  is      => ro =>,
  lazy    => 1,
  builder => sub {
    require CPAN::Changes::Markdown::Filter;
    return CPAN::Changes::Markdown::Filter->new( rules => [ rule_VersionsToCode, rule_UnderscoredToCode ] );
  }
);
has line_filter => (
  is      => ro =>,
  lazy    => 1,
  builder => sub {
    require CPAN::Changes::Markdown::Filter;
    return CPAN::Changes::Markdown::Filter->new(
      rules => [ rule_VersionsToCode, rule_UnderscoredToCode, rule_PackageNamesToCode ] );
  }
);

=method C<load>

    my $ccm = CPAN::Changes::Markdown->load( path/to/file );

=cut

sub load {
  my ( $self, $path ) = @_;
  require CPAN::Changes;
  return $self->new( changes => CPAN::Changes->load($path) );
}

sub load_string {
  my ( $self, $string ) = @_;
  require CPAN::Changes;
  return $self->new( changes => CPAN::Changes->load_string($string) );
}

sub load_utf8 {
  my ( $self, $path ) = @_;
  require Path::Tiny;
  require CPAN::Changes;
  return $self->new( changes => CPAN::Changes->load_string( Path::Tiny::path($path)->slurp_utf8 ) );
}

sub _serialize_release {
  my ( $self, %args ) = @_;

  my $release = delete $args{release};
  my @output;

  push @output, sprintf q[## %s], ( join q[ ], grep { defined && length } ( $release->version, $release->date, $release->note ) );

  for my $group ( $release->groups( sort => $args{group_sort} ) ) {
    if ( length $group ) {
      push @output, sprintf q[### %s], $self->header_filter->process($group);
    }
    for my $line ( @{ $release->changes($group) } ) {
      push @output, ' - ' . $self->line_filter->process($line);
    }
    push @output, q[];
  }
  return @output;
}

=method C<serialize>

    my $string = $ccm->serialize();

=cut

sub serialize {
  my ( $self, %args ) = @_;
  my %release_args;
  $release_args{group_sort} = $args{group_sort} if $args{group_sort};

  my @output;

  if ( $self->changes->preamble ) {
    push @output, sprintf q[# %s], $self->changes->preamble;
    push @output, q[];
  }

  my @r = $self->changes->releases;
  @r = reverse @r unless $args{reverse};    # not a typo!
  for my $release (@r) {
    push @output, $self->_serialize_release( release => $release, %release_args );
  }
  return join qq[\n], @output;
}

no Moo;

1;
