use 5.006;    # our
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Node::DelimitedText;

# ABSTRACT: A region of text that is marked up

our $VERSION = '1.000002';

# AUTHORITY

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::NodeUtil qw( :all );

    my $delimitedtext = mk_node_delimitedtext(q[`], "The text here", q[`]);

    print $delimitedtext->to_s() # `The text here`

    print $delimitedtext->content # The text here

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

use Moo qw( with has );
with 'CPAN::Changes::Markdown::Role::Filter::Node';

=attr C<content>

  required

=cut

has content => ( is => ro =>, required => 1, );

=attr C<before_text>

  required

=cut

has before_text => ( is => ro =>, required => 1, );

=attr C<after_text>

  required

=cut

has after_text => ( is => ro =>, required => 1, );

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
    after_text  => $after,
  );
}

=method C<to_s>

=cut

sub to_s {
  my ($self) = @_;
  return $self->before_text . $self->content . $self->after_text;
}

1;
