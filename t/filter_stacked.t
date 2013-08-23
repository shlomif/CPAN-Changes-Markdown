
use strict;
use utf8;
use warnings;

use Test::More;

use CPAN::Changes::Markdown::Filter;
use CPAN::Changes::Markdown::Filter::RuleUtil qw( :all );

my $filter = CPAN::Changes::Markdown::Filter->new( rules => [ rule_UnderscoredToCode, rule_VersionsToCode ] );

is( $filter->process("something_underscored"), "`something_underscored`", 'underscores highlight' );
is( $filter->process("1.0"),                   "`1.0`",                   'single decimals highlight' );
is( $filter->process("1.0.0"),                 "`1.0.0`",                 'multipart decimals highlight' );
is( $filter->process("v1.0"),                  "`v1.0`",                  'single decimals with v-prefix highlight' );
is( $filter->process("v1.0.0"),                "`v1.0.0`",                'multipart decimals with v-prefix highlight' );

is( $filter->process("something_underscored 1.0"), "`something_underscored` `1.0`", '+underscore single decimals highlight' );
is(
  $filter->process("something_underscored 1.0.0"),
  "`something_underscored` `1.0.0`",
  '+underscore multipart decimals highlight'
);
is(
  $filter->process("something_underscored v1.0"),
  "`something_underscored` `v1.0`",
  '+underscore single decimals with v-prefix highlight'
);
is(
  $filter->process("something_underscored v1.0.0"),
  "`something_underscored` `v1.0.0`",
  '+underscore multipart decimals with v-prefix highlight'
);
is(
  $filter->process("Dist::Zilla::PluginBundle::Author::KENTNL v1.0.0 → v1.3.0"),
  "Dist::Zilla::PluginBundle::Author::KENTNL `v1.0.0` → `v1.3.0`",
  "Unicode containing string works"
);

done_testing;

