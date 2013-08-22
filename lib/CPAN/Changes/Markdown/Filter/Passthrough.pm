use strict;
use warnings;
 
package CPAN::Changes::Markdown::Filter::Passthrough;

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

sub process {
    return $_[1];
}

1;
