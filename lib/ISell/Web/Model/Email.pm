package ISell::Web::Model::Email;
use strict;
use warnings;
use base 'Catalyst::Model::Factory';

__PACKAGE__->config(class => 'Mail::Builder::Simple');

1;
