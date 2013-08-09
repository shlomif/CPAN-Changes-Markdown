use strict;
use warnings;

package CPAN::Changes::Markdown;

# ABSTRACT: Format your Changes file ( or a section of it ) in Markdown

use Moo 1.000008;

=head1 SYNOPSIS

    use CPAN::Changes::Markdown;

    my $changes = CPAN::Changes::Markdown->load( $path_to_changes_file );

    print $changes->serialize # emits Markdown

=cut

=head1 DESCRIPTION

Mostly, this is wrapper around CPAN::Changes that just formats the output differently.

Primary usecase for me is writing github release notes.

I plan to eventually have hookable filters and stuff to highlight various tokens in a github friendly way.

=cut

=attr C<changes>

=cut

has changes => (
  is      => ro =>,
  lazy    => 1,
  builder => sub {
    require CPAN::Changes;
    return CPAN::Changes->new();
  }
);

=method C<load>

    my $ccm = CPAN::Changes::Markdown->load( path/to/file );

=cut

sub load {
  my ( $self, $path ) = @_;
  require CPAN::Changes;
  $self->new( changes => CPAN::Changes->load($path) );
}

sub _serialize_release {
  my $self = shift;
  my %args = @_;

  my $release = delete $args{release};
  my @output;

  push @output, sprintf q[## %s], ( join ' ', grep { defined && length } ( $release->version, $release->date, $release->note ) );

  for my $group ( $release->groups( sort => $args{group_sort} ) ) {
    if ( length $group ) {
      push @output, sprintf q[### %s], $group;
    }
    for my $line ( @{ $release->changes($group) } ) {
      push @output, ' - ' . $line;
    }
    push @output, q[];
  }
  return @output;
}

=method C<serialize>

    my $string = $ccm->serialize();

=cut

sub serialize {
  my $self = shift;
  my %args = @_;
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
