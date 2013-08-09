use strict;
use warnings;

package CPAN::Changes::Markdown;
BEGIN {
  $CPAN::Changes::Markdown::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::VERSION = '0.1.0';
}

# ABSTRACT: Format your Changes file ( or a section of it ) in Markdown

use Moo 1.000008;




has changes => (
  is      => ro =>,
  lazy    => 1,
  builder => sub {
    require CPAN::Changes;
    return CPAN::Changes->new();
  },
);


sub load {
  my ( $self, $path ) = @_;
  require CPAN::Changes;
  return $self->new( changes => CPAN::Changes->load($path) );
}

sub _serialize_release {
  my ( $self, %args ) = @_;

  my $release = delete $args{release};
  my @output;

  push @output, sprintf q[## %s], ( join q[ ], grep { defined && length } ( $release->version, $release->date, $release->note ) );

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

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown - Format your Changes file ( or a section of it ) in Markdown

=head1 VERSION

version 0.1.0

=head1 SYNOPSIS

    use CPAN::Changes::Markdown;

    my $changes = CPAN::Changes::Markdown->load( $path_to_changes_file );

    print $changes->serialize # emits Markdown

=head1 DESCRIPTION

Mostly, this is wrapper around CPAN::Changes that just formats the output differently.

Primary use case for me is writing C<Github> release notes.

I plan to eventually have hook filters and stuff to highlight various tokens in a C<Github> friendly way.

=head1 METHODS

=head2 C<load>

    my $ccm = CPAN::Changes::Markdown->load( path/to/file );

=head2 C<serialize>

    my $string = $ccm->serialize();

=head1 ATTRIBUTES

=head2 C<changes>

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
