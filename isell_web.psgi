use strict;
use warnings;

use ISell::Web;

my $app = ISell::Web->apply_default_middlewares(ISell::Web->psgi_app);
$app;

