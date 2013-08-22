
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Node::DelimitedText;

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

has content     => ( is => rw =>, required => 1 );
has before_text => ( is => ro =>, required => 1 );
has after_text  => ( is => ro =>, required => 1 );

sub create {
    my ( $self, $before, $content, $after ) = @_;
    return $self->new(
        content     => $content,
        before_text => $before,
        after_text  => $after
    );
}

sub substr {
    my ( $self, $start, $length ) = @_;
    my $content = substr $self->content, $start, $length;
    return __PACKAGE__->new( content => $content );
}

sub to_s {
    my ( $self ) = @_;
    return $self->before_text . $self->content . $self->after_text;
}

1;
