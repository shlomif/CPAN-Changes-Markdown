use 5.006;    # our
use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter;

# ABSTRACT: A text filter of some kind

our $VERSION = '1.000003';

# AUTHORITY

use Role::Tiny qw( requires );

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter",
    "interface":"role"
}

=end MetaPOD::JSON

=cut

=requires C<process>

  my $processed_text = $self->process( $text );

=cut

requires 'process';

1;
