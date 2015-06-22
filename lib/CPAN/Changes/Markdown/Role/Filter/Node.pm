use 5.006;    # our
use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter::Node;

# ABSTRACT: A parse node of some kind

our $VERSION = '1.000001';

# AUTHORITY

use Role::Tiny qw( requires );

=requires C<to_s>

=cut

requires 'to_s';

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter::Node",
    "interface":"role"
}

=end MetaPOD::JSON

=cut

1;
