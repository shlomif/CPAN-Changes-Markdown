
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Node::PlainText;
$CPAN::Changes::Markdown::Filter::Node::PlainText::VERSION = '0.2.3';
# ABSTRACT: A text node that contains markup-free text.























use Moo;

with 'CPAN::Changes::Markdown::Role::Filter::Node';







has content => ( is => rw =>, required => 1 );









sub create {
  my ( $self, $content ) = @_;
  return $self->new( content => $content );
}







sub to_s {
  my ( $self, ) = @_;
  return $self->content;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

CPAN::Changes::Markdown::Filter::Node::PlainText - A text node that contains markup-free text.

=head1 VERSION

version 0.2.3

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::NodeUtil qw( :all );

    my $plaintext = mk_node_plaintext("The text here");

=head1 METHODS

=head2 C<content>

=head2 C<create>

Slightly shorter hand for C<new>

    $class->create( $text ) == $class->new( content => $text )

=head2 C<to_s>

Represent this node back as text.

=head1 ATTRIBUTES

=head2 C<content>

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Node::PlainText",
    "does":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"class",
    "inherits":"Moo::Object"

}

=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
