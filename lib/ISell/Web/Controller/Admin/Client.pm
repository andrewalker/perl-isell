package ISell::Web::Controller::Admin::Client;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' };

sub list :Chained('/admin/auth/base') PathPart('') Args(0) {
    my ($self, $ctx) = @_;

    $ctx->stash(
        template => 'admin/client/list.tx',
        clients => [
            map {
                {
                    id    => $_->id,
                    cpf   => $_->cpf,
                    name  => $_->first_name . ' ' . $_->last_name,
                    email => $_->email,
                    sales => $_->shopping_orders->count,
                }
            } $ctx->model('DB::Client')->all
        ],
    );
}

__PACKAGE__->meta->make_immutable;

1;
