use strict;
use warnings;

package CPAN::Changes::Markdown::Role::Filter::Node;
BEGIN {
  $CPAN::Changes::Markdown::Role::Filter::Node::AUTHORITY = 'cpan:KENTNL';
}
{
  $CPAN::Changes::Markdown::Role::Filter::Node::VERSION = '0.2.1';
}

# ABSTRACT: A parse node of some kind

use Role::Tiny;


requires 'to_s';


1;

__END__

=pod

=encoding utf-8

=head1 NAME

CPAN::Changes::Markdown::Role::Filter::Node - A parse node of some kind

=head1 VERSION

version 0.2.1

=head1 ROLE REQUIRES

=head2 C<to_s>

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Role::Filter::Node",
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
