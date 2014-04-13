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

    my $fields = $ctx->req->params || {};
    my $list = $ctx->model->list($fields);

    $ctx->stash(
        products => $list->{products},
        pager    => $list->{pager},
        template => 'product/list.tx',
        fields   => $fields,
    );
}

sub single : Chained('base') PathPart('') Args(1) {
    my ($self, $ctx, $id) = @_;

    $ctx->stash( product => $ctx->model->find($id) );
}

__PACKAGE__->meta->make_immutable;

1;
