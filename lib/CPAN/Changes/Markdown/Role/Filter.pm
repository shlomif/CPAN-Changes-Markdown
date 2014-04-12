use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Role::Filter;

# ABSTRACT: A text filter of some kind

# AUTHORITY

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter",
    "interface":"role"

}

=end MetaPOD::JSON

=cut

use Role::Tiny;

=requires C<process>

=cut

requires 'process';

1;
