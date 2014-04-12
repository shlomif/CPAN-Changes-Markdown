use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Rule::VersionsToCode;
$CPAN::Changes::Markdown::Filter::Rule::VersionsToCode::VERSION = '0.2.3';
# ABSTRACT: Quote things that look like numbers as code entries.

use Moo;
use CPAN::Changes::Markdown::Filter::NodeUtil qw( mk_node_plaintext mk_node_delimitedtext );






















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

__END__

=pod

=encoding UTF-8

=head1 NAME

CPAN::Changes::Markdown::Filter::Rule::VersionsToCode - Quote things that look like numbers as code entries.

=head1 VERSION

version 0.2.3

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::RuleUtil qw(:all);

    my $instance = rule_VersionsToCode( @args );

=head1 METHODS

=head2 C<filter_plaintext>

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Rule::VersionsToCode",
    "interface":"class",
    "inherits":"Moo::Object",
    "does":"CPAN::Changes::Markdown::Role::Filter::Rule::PlainText"
}


=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
