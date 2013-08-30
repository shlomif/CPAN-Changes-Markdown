
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.4007"
  },
  "configure_requires" => {
    "Module::Build" => "0.4007"
  },
  "dist_abstract" => "Format your Changes file ( or a section of it ) in Markdown",
  "dist_author" => [
    "Kent Fredric <kentfredric\@gmail.com>"
  ],
  "dist_name" => "CPAN-Changes-Markdown",
  "dist_version" => "0.2.1",
  "license" => "perl",
  "module_name" => "CPAN::Changes::Markdown",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "CPAN::Changes" => 0,
    "Moo" => "1.000008",
    "Path::Tiny" => 0,
    "Role::Tiny" => 0,
    "Sub::Exporter::Progressive" => 0,
    "perl" => "v5.10.0",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => "0.98",
    "utf8" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
