use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Rule::NumericsToCode;

# ABSTRACT: Quote things that look like numbers as code entries.

use Moo;
use CPAN::Changes::Markdown::Filter::NodeUtil qw( mk_node_plaintext mk_node_delimitedtext );

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Rule::NumericsToCode",
    "interface":"class",
    "inherits":"Moo::Object",
    "does":"CPAN::Changes::Markdown::Role::Filter::Rule::PlainText"
}

=end MetaPOD::JSON

=cut

with "CPAN::Changes::Markdown::Role::Filter::Rule::PlainText";

sub _inject_code_delim {
  my ( $self, $out, $before, $code, $after ) = @_;
  push @{$out}, mk_node_plaintext($before);
  push @{$out}, mk_node_delimitedtext( '`', $code, '`' );
  push @{$out}, $self->filter_plaintext( mk_node_plaintext($after) );
  return @{$out};
}

sub filter_plaintext {
  my ( $self, $input ) = @_;
  my @output;
  if ( $input->content !~ /\d/ ) {
    return $input;
  }

  if ( $input->content =~ /(\A|\A.*?\s)([\d._]+)(\z|\s.*\z)/ms ) {
    return $self->_inject_code_delim( [], $1, $2, $3 );
  }
  return $input;
}

1;
