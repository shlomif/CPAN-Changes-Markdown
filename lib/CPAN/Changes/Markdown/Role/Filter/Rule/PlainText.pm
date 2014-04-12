use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter::Rule::PlainText;

# ABSTRACT: A rule that only filters C<plaintext> nodes.

# AUTHORITY

=head1 SYNOPSIS

    package Example::Rule;

    use Role::Tiny::With;

    with 'CPAN::Changes::Markdown::Role::Filter::Rule::PlainText';

    sub filter_plaintext {
        my ( $self, @nodes ) = @_;
        return ( @nodes );
    }

=cut

use Role::Tiny;

=requires C<filter_plaintext>

=cut

requires 'filter_plaintext';

with 'CPAN::Changes::Markdown::Role::Filter::Rule';

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter::Rule::PlainText",
    "interface":"role",
    "does":"CPAN::Changes::Markdown::Role::Filter::Rule"
}

=end MetaPOD::JSON

=cut

=method C<filter>

=cut

sub filter {
  my ( $self, @input ) = @_;
  my @output;
  for my $input (@input) {
    if ( not $input->isa('CPAN::Changes::Markdown::Filter::Node::PlainText') ) {
      push @output, $input;
      next;
    }
    push @output, $self->filter_plaintext($input);
  }
  return @output;
}

1;
