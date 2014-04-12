use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter;
$CPAN::Changes::Markdown::Role::Filter::VERSION = '0.2.3';
# ABSTRACT: A text filter of some kind













use Role::Tiny;





requires 'process';

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

CPAN::Changes::Markdown::Role::Filter - A text filter of some kind

=head1 VERSION

version 0.2.3

=head1 ROLE REQUIRES

=head2 C<process>

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter",
    "interface":"role"

}

=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
