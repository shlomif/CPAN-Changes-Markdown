use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter::Rule;

# ABSTRACT: A step filter

# AUTHORITY

use Role::Tiny;

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
