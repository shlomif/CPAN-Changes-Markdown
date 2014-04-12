use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Filter::Node::DelimitedText;

# ABSTRACT: A region of text that is marked up

# AUTHORITY

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::NodeUtil qw( :all );

    my $delimitedtext = mk_node_delimitedtext(q[`], "The text here", q[`]);

=cut

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Node::DelimitedText",
    "does":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"class",
    "inherits":"Moo::Object"

}

=end MetaPOD::JSON

=cut

use Moo;
with 'CPAN::Changes::Markdown::Role::Filter::Node';

=attr C<content>

=method C<content>

=cut

has content => ( is => ro =>, required => 1 );

=attr C<before_text>

=method C<before_text>

=cut

has before_text => ( is => ro =>, required => 1 );

=attr C<after_text>

=method C<after_text>

=cut

has after_text => ( is => ro =>, required => 1 );

=method C<create>

A short-hand for C<new>

    $class->create($a,$b,$c) == $class->new(
        before_text => $a,
        content     => $b,
        after_text  => $c,
    );

=cut

sub create {
  my ( $self, $before, $content, $after ) = @_;
  return $self->new(
    content     => $content,
    before_text => $before,
    after_text  => $after
  );
}

=method C<to_s>

=cut

sub to_s {
  my ($self) = @_;
  return $self->before_text . $self->content . $self->after_text;
}

1;
