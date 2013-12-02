package ISell::Web::Controller::Client;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' };

sub base : Chained('/') PathPrefix CaptureArgs(0) {
    my ($self, $ctx) = @_;

    $ctx->stash(
        current_model => 'DB::Client',
    );
}

sub signup : Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    if ($ctx->req->method eq 'POST') {
        my $client = $ctx->model->try_to_create($ctx->req->body_params);
        if (!$client) {
            $ctx->stash(failed => 1);
        }
        else {
            $ctx->session(client => $client);
            $ctx->res->redirect('/shopping_cart');
            return;
        }
    }
}

sub login : Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    my $user = $ctx->req->body_params->{login};
    my $pass = $ctx->req->body_params->{password};

    my $client = $ctx->model->search({ login => $user, password => $pass })->first;

    if (!$client) {
        $ctx->stash(failed => 1);
    }
    else {
        $ctx->session(client => $client);
        $ctx->res->redirect('/shopping_cart');
        return;
    }
}

__PACKAGE__->meta->make_immutable;

1;
