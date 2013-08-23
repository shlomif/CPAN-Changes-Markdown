
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Node::PlainText;

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Node::PlainText",
    "does":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"class",
    "inherits":"Moo::Object"

}

=end MetaPOD::JSON

=cut

use Moo;

with 'CPAN::Changes::Markdown::Role::Filter::Node';

has content => ( is => rw =>, required => 1 );

sub create {
  my ( $self, $content ) = @_;
  return $self->new( content => $content );
}

sub substr {
  my ( $self, $start, $length ) = @_;
  my $content = substr $self->content, $start, $length;
  return __PACKAGE__->new( content => $content );
}

sub to_s {
  my ( $self, ) = @_;
  return $self->content;
}

1;
