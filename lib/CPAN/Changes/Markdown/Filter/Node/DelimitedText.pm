
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Node::DelimitedText;
BEGIN {
  $CPAN::Changes::Markdown::Filter::Node::DelimitedText::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Filter::Node::DelimitedText::VERSION = '0.2.0';
}

# ABSTRACT: A region of text that is marked up



use Moo;
with 'CPAN::Changes::Markdown::Role::Filter::Node';


has content => ( is => ro =>, required => 1 );


has before_text => ( is => ro =>, required => 1 );


has after_text => ( is => ro =>, required => 1 );


sub create {
  my ( $self, $before, $content, $after ) = @_;
  return $self->new(
    content     => $content,
    before_text => $before,
    after_text  => $after
  );
}


sub to_s {
  my ($self) = @_;
  return $self->before_text . $self->content . $self->after_text;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Filter::Node::DelimitedText - A region of text that is marked up

=head1 VERSION

version 0.2.0

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::NodeUtil qw( :all );

    my $delimitedtext = mk_node_delimitedtext(q[`], "The text here", q[`]);

=head1 METHODS

=head2 C<content>

=head2 C<before_text>

=head2 C<after_text>

=head2 C<create>

A short-hand for C<new>

    $class->create($a,$b,$c) == $class->new(
        before_text => $a,
        content     => $b,
        after_text  => $c,
    );

=head2 C<to_s>

=head1 ATTRIBUTES

=head2 C<content>

=head2 C<before_text>

=head2 C<after_text>

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Node::DelimitedText",
    "does":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"class",
    "inherits":"Moo::Object"

}

=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
