use 5.006;    # our
use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter::Rule;

# ABSTRACT: A step filter

our $VERSION = '1.000002';

# AUTHORITY

use Role::Tiny qw( requires );

=requires C<filter>

=cut

requires 'filter';

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter::Rule",
    "interface":"role"
}

=end MetaPOD::JSON

=cut

1;
