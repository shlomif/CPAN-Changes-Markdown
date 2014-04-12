use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Filter::Passthrough;

# ABSTRACT: A Filter drop-in that doesn't process anything.

# AUTHORITY

=head1 SYNOPSIS

    my $filter = CPAN::Changes::Markdown::Filter::Passthrough->new();
    my $output = $filter->process( $input );
    # $output == $input

=cut

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::Passthrough",
    "interface":"class",
    "does":"CPAN::Changes::Markdown::Role::Filter",
    "inherits":"Moo::Object"
}

=end MetaPOD::JSON

=cut

use Moo;

with 'CPAN::Changes::Markdown::Role::Filter';

=method C<process>

=cut

## no critic (RequireArgUnpacking)

sub process {
  return $_[1];
}

1;
