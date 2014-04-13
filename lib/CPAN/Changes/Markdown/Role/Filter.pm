use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Role::Filter;

# ABSTRACT: A text filter of some kind

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
