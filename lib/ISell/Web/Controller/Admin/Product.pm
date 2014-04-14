package ISell::Web::Controller::Admin::Product;
use Moose;
use namespace::autoclean;
use Try::Tiny;

BEGIN { extends 'Catalyst::Controller' };

sub base :Chained('/admin/auth/base') PathPart('product') CaptureArgs(0) {
    my ($self, $ctx) = @_;

    $ctx->load_status_msgs;

    $ctx->stash(current_model => 'DB::Product');
}

sub list :Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    my $fields = $ctx->req->params || {};
    $fields->{rows} = 20;
    $fields->{sort} = '+id';

    my $list = $ctx->model->list($fields);

    $ctx->stash(
        template => 'admin/product/list.tx',
        products => $list->{products},
        pager    => $list->{pager},
        fields   => $fields,
    );
}

sub edit :Chained('base') PathPart('') Args(1) {
    my ($self, $ctx, $id) = @_;

    my $rs = $ctx->model;
    $rs->result_class('DBIx::Class::ResultClass::HashRefInflator');

    my $item = $rs->find($id);

    $ctx->stash(
        template => 'admin/product/form.tx',
        item => $item,
    );
}

sub add :Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    $ctx->stash( template => 'admin/product/form.tx', item => {}, );
}

sub save :Chained('base') Args(0) POST {
    my ($self, $ctx) = @_;

    my $item = $ctx->req->body_params;
    delete $item->{id} if !$item->{id};

    my $rs = $ctx->model;

    my $ok = 1;

    my $row;

    try {
        $row = $rs->update_or_create($item);
    }
    catch {
        $ok = 0;
    };

    if (!$ok) {
        return $ctx->res->redirect(
            $ctx->uri_for(
                $self->action_for($item->{id} ? 'edit' : 'add'),
                [ $item->{id} ? $item->{id} : () ],
                { mid => $ctx->set_error_msg('Não foi possível salvar o produto. Verifique o formulário e envie novamente.') },
            )
        );
    }

    return $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('edit'),
            [ $row->id ],
            { mid => $ctx->set_status_msg('Salvo com sucesso.') },
        )
    );
}

sub remove :Chained('base') Args(1) {
    my ($self, $ctx, $id) = @_;

    $ctx->model->find($id)->delete;

    return $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('list'),
            { mid => $ctx->set_status_msg('Removido com sucesso.') },
        )
    );
}

__PACKAGE__->meta->make_immutable;

1;
