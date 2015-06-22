use 5.006;    # our
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::Passthrough;

# ABSTRACT: A Filter drop-in that doesn't process anything.

our $VERSION = '1.000001';

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

use Moo qw( with );

with 'CPAN::Changes::Markdown::Role::Filter';

=method C<process>

=cut

## no critic (RequireArgUnpacking)

sub process {
  return $_[1];
}

1;
