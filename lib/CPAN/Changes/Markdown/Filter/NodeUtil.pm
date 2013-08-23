
use strict;
use warnings;

package CPAN::Changes::Markdown::Filter::NodeUtil;

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"CPAN::Changes::Markdown::Filter::NodeUtil",
    "interface":"exporter"
}

=end MetaPOD::JSON

=cut

use Sub::Exporter::Progressive -setup => { exports => [qw( mk_node_plaintext mk_node_delimitedtext )] };

sub mk_node_plaintext {
  require CPAN::Changes::Markdown::Filter::Node::PlainText;
  return CPAN::Changes::Markdown::Filter::Node::PlainText->create(@_);
}

sub mk_node_delimitedtext {
  require CPAN::Changes::Markdown::Filter::Node::DelimitedText;
  return CPAN::Changes::Markdown::Filter::Node::DelimitedText->create(@_);
}

1;
