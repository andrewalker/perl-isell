package ISell::Web::Controller::Admin::Home;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' };

sub sales :Chained('/admin/auth/base') PathPart('') Args(0) {
    my ($self, $ctx) = @_;

    my @shops = $ctx->model('DB::ShoppingOrder')->search({}, { order_by => { -desc => 'created_at' }})->all;

    my @result;

    for (@shops) {
        push @result, {
            id => $_->id,
            date => $_->created_at->strftime('%d/%m/%Y'),
            client => $_->client->first_name . ' ' . $_->client->last_name,
            city => $_->client->city,
            status => eval { $_->payments->search({}, { order_by => { -desc => 'created_at' } })->first->status },
        };
    }


    $ctx->stash( sales => \@result, template => 'admin/index.tx' );
}

__PACKAGE__->meta->make_immutable;

1;
