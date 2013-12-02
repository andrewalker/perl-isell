#!/usr/bin/env perl
use warnings;
use strict;
use FindBin '$Bin';
use lib "$Bin/../lib";
use DBIx::Class::Schema::Loader ();
use ISell::Web ();

my $opts = {
    dump_directory => "$Bin/../lib",
    components => [ 'EncodedColumn', 'InflateColumn::DateTime' ],
    quote_names => 1,
    db_schema => [ 'isell' ],
};

my $info = ISell::Web->model('DB')->connect_info;

DBIx::Class::Schema::Loader::make_schema_at(
    'ISell::Schema',
    $opts,
    [ $info->{dsn}, $info->{user}, $info->{password} ],
);
