package ISell::Web::Controller::Admin::Sale;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' };

sub base :Chained('/admin/auth/base') PathPart('') CaptureArgs(0) {
    my ($self, $ctx) = @_;
    $ctx->load_status_msgs();
    $ctx->stash(current_model => 'DB::ShoppingOrder');
}

sub sales :Chained('base') PathPart('') Args(0) {
    my ($self, $ctx) = @_;

    my @shops = $ctx->model->search({}, { order_by => { -desc => 'created_at' }})->all;

    my @result;

    for (@shops) {
        push @result, {
            id => $_->id,
            date => $_->created_at->strftime('%d/%m/%Y'),
            client => $_->client->first_name . ' ' . $_->client->last_name,
            city => $_->client->city,
            status => ( eval { $_->payments->first->status } || "Iniciado" ),
        };
    }


    $ctx->stash( sales => \@result, template => 'admin/index.tx' );
}

sub sale :Chained('base') CaptureArgs(1) {
    my ($self, $ctx, $id) = @_;

    my $sale = $ctx->model->find($id);

    $ctx->stash(
        id      => $id,
        sale    => $sale,
        payment => $sale->payments->first,
    );
}

sub view :Chained('sale') PathPart('') Args(0) {
    my ($self, $ctx) = @_;

    my @items = $ctx->stash->{sale}->shopping_order_items->all;

    my $total = 0;

    for (@items) {
        $total += $_->product->price * $_->quantity;
    }

    $ctx->stash(
        template => 'admin/sale.tx',
        total    => $total,
        items    => \@items,
    );
}

sub cancel :Chained('sale') Args(0) {
    my ($self, $ctx) = @_;

    $ctx->stash->{payment}->update({ status => 'Cancelada' });

    $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('view'),
            [ $ctx->stash->{id} ],
            { mid => $ctx->set_status_msg("Venda cancelada.") }
        )
    );
}

sub confirm :Chained('sale') Args(0) {
    my ($self, $ctx) = @_;

    $ctx->stash->{payment}->update({ status => 'Confirmada' });

    $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('view'),
            [ $ctx->stash->{id} ],
            { mid => $ctx->set_status_msg("Venda confirmada.") }
        )
    );
}

__PACKAGE__->meta->make_immutable;

1;
