use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Filter::RuleUtil;

# ABSTRACT: short-hand for constructing rule objects.

# AUTHORITY

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::RuleUtil qw(:all);

    rule_NumericsToCode() # Create instance passing @_

=cut

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::RuleUtil",
    "interface":"exporter"
}

=end MetaPOD::JSON

=cut

use Sub::Exporter::Progressive -setup =>
  { exports => [qw( rule_NumericsToCode rule_UnderscoredToCode rule_PackageNamesToCode rule_VersionsToCode )] };

=export C<rule_NumericsToCode>

=cut

## no critic ( RequireArgUnpacking Capitalization NamingConventions::ProhibitMixedCaseSub )

sub rule_NumericsToCode {
  require CPAN::Changes::Markdown::Filter::Rule::NumericsToCode;
  return CPAN::Changes::Markdown::Filter::Rule::NumericsToCode->new(@_);
}

=export C<rule_UnderscoredToCode>

=cut

sub rule_UnderscoredToCode {
  require CPAN::Changes::Markdown::Filter::Rule::UnderscoredToCode;
  return CPAN::Changes::Markdown::Filter::Rule::UnderscoredToCode->new(@_);
}

=export C<rule_PackageNamesToCode>

=cut

sub rule_PackageNamesToCode {
  require CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode;
  return CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode->new(@_);
}

=export C<rule_VersionsToCode>

=cut

sub rule_VersionsToCode {
  require CPAN::Changes::Markdown::Filter::Rule::VersionsToCode;
  return CPAN::Changes::Markdown::Filter::Rule::VersionsToCode->new(@_);
}

1;

