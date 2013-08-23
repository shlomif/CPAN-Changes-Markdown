use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter::Rule;
BEGIN {
  $CPAN::Changes::Markdown::Role::Filter::Rule::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Role::Filter::Rule::VERSION = '0.2.0';
}

# ABSTRACT: A step filter

use Role::Tiny;


requires 'filter';


1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Role::Filter::Rule - A step filter

=head1 VERSION

version 0.2.0

=head1 ROLE REQUIRES

=head2 C<filter>

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter::Rule",
    "interface":"role"
}


=end MetaPOD::JSON

=head1 AUTHOR

Kent Fredric <kentfredric@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Kent Fredric <kentfredric@gmail.com>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
