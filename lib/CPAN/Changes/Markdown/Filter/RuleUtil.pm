
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::RuleUtil;

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::RuleUtil",
    "interface":"exporter"
}

=end MetaPOD::JSON

=cut

use Sub::Exporter::Progressive -setup =>
  { exports => [qw( rule_NumericsToCode rule_UnderscoredToCode rule_PackageNamesToCode rule_VersionsToCode )] };

sub rule_NumericsToCode {
  require CPAN::Changes::Markdown::Filter::Rule::NumericsToCode;
  return CPAN::Changes::Markdown::Filter::Rule::NumericsToCode->new(@_);
}

sub rule_UnderscoredToCode {
  require CPAN::Changes::Markdown::Filter::Rule::UnderscoredToCode;
  return CPAN::Changes::Markdown::Filter::Rule::UnderscoredToCode->new(@_);
}

sub rule_PackageNamesToCode {
  require CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode;
  return CPAN::Changes::Markdown::Filter::Rule::PackageNamesToCode->new(@_);
}

sub rule_VersionsToCode {
  require CPAN::Changes::Markdown::Filter::Rule::VersionsToCode;
  return CPAN::Changes::Markdown::Filter::Rule::VersionsToCode->new(@_);
}

1;

