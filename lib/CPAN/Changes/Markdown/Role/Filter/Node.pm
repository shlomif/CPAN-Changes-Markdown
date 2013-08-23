use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter::Node;

# ABSTRACT: A parse node of some kind

use Role::Tiny;

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
