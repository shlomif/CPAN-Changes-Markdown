use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Filter::Node::PlainText;

# ABSTRACT: A text node that contains markup-free text.

# AUTHORITY

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::NodeUtil qw( :all );

    my $plaintext = mk_node_plaintext("The text here");

=cut

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Node::PlainText",
    "does":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"class",
    "inherits":"Moo::Object"

}

=end MetaPOD::JSON

=cut

use Moo qw( with has );

with 'CPAN::Changes::Markdown::Role::Filter::Node';

=attr C<content>

=method C<content>

=cut

has content => ( is => rw =>, required => 1 );

=method C<create>

Slightly shorter hand for C<new>

    $class->create( $text ) == $class->new( content => $text )

=cut

sub create {
  my ( $self, $content ) = @_;
  return $self->new( content => $content );
}

=method C<to_s>

Represent this node back as text.

=cut

sub to_s {
  my ( $self, ) = @_;
  return $self->content;
}

1;
