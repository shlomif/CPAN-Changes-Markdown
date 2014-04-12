use 5.008;    # utf8
use strict;
use warnings;
use utf8;

package CPAN::Changes::Markdown::Filter::NodeUtil;

# ABSTRACT: short-hand node construction functions

# AUTHORITY

=head1 SYNOPSIS

    use CPAN::Changes::Markdown::Filter::NodeUtil;

    my $node = mk_node_plaintext('text');

=cut

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::NodeUtil",
    "interface":"exporter"
}

=end MetaPOD::JSON

=cut

use Sub::Exporter::Progressive -setup => { exports => [qw( mk_node_plaintext mk_node_delimitedtext )] };

=export C<mk_node_plaintext>

=cut

## no critic ( RequireArgUnpacking )

sub mk_node_plaintext {
  require CPAN::Changes::Markdown::Filter::Node::PlainText;
  return CPAN::Changes::Markdown::Filter::Node::PlainText->create(@_);
}

=export C<mk_node_delimitedtext>

=cut

sub mk_node_delimitedtext {
  require CPAN::Changes::Markdown::Filter::Node::DelimitedText;
  return CPAN::Changes::Markdown::Filter::Node::DelimitedText->create(@_);
}

1;
