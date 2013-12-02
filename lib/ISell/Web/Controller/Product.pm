package ISell::Web::Controller::Product;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' };

sub base : Chained('/') PathPrefix CaptureArgs(0) {
    my ($self, $ctx) = @_;

    $ctx->stash(
        current_model => 'DB::Product',
    );
}

sub list : Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    my $list = $ctx->model->list($ctx->req->params);

    $ctx->stash(
        products => $list->{products},
        pager    => $list->{pager},
    );
}

sub show : Chained('base') Args(1) {
    my ($self, $ctx, $id) = @_;

    $ctx->stash( product => $ctx->model->find($id) );
}

__PACKAGE__->meta->make_immutable;

1;
