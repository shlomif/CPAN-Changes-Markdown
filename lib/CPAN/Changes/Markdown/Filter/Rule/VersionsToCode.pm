use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Rule::VersionsToCode;

# ABSTRACT: Quote things that look like numbers as code entries.

use Moo;
use CPAN::Changes::Markdown::Filter::NodeUtil qw( mk_node_plaintext mk_node_delimitedtext );

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Rule::VersionsToCode",
    "interface":"class",
    "inherits":"Moo::Object",
    "does":"CPAN::Changes::Markdown::Role::Filter::Rule::PlainText"
}

=end MetaPOD::JSON

=cut

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::RuleUtil qw(:all);

    my $instance = rule_VersionsToCode( @args );

=cut

with 'CPAN::Changes::Markdown::Role::Filter::Rule::PlainText';

sub _inject_code_delim {
  my ( $self, $out, $before, $code, $after ) = @_;
  push @{$out}, mk_node_plaintext($before);
  push @{$out}, mk_node_delimitedtext( q{`}, $code, q{`} );
  push @{$out}, $self->filter_plaintext( mk_node_plaintext($after) );
  return @{$out};
}

my $re_version = qr/(\A|\A.*?\s) ( v? [\d._]+ (?:-TRIAL)? ) (\z|\s.*\z)/msx;
my $re_number  = qr/                   \d                              /msx;

=method C<filter_plaintext>

=cut

sub filter_plaintext {
  my ( $self, $input ) = @_;
  if ( $input->content !~ $re_number ) {
    return $input;
  }

  if ( $input->content =~ $re_version ) {
    return $self->_inject_code_delim( [], $1, $2, $3 );
  }
  return $input;
}

1;
