package ISell::Web::Controller::ShoppingCart;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' };

__PACKAGE__->config(namespace => 'shopping_cart');

sub base : Chained('/') PathPrefix CaptureArgs(0) {
    my ($self, $ctx) = @_;

    if (!$ctx->session->{client}) {
        return $ctx->res->redirect('/client/login');
    }
}

sub add : Chained('base') Args(1) {
    my ($self, $ctx, $id) = @_;

    my $cart = $ctx->session->{cart} || [];

    push @$cart, $id;

    $ctx->session->{cart} = $cart;

    $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('list'),
            { mid => $ctx->set_status_msg("Item adicionado com sucesso.") }
        )
    );
}

sub remove : Chained('base') Args(1) {
    my ($self, $ctx, $id) = @_;

    my @old_cart = @{ $ctx->session->{cart} || [] };

    my @new_cart;

    for my $item (@old_cart) {
        if ($item != $id) {
            push @new_cart, $item;
        }
    }

    $ctx->session->{cart} = \@new_cart;

    $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('list'),
            { mid => $ctx->set_status_msg("Item removido com sucesso.") }
        )
    );
}

sub clear : Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    $ctx->session->{cart} = [];

    $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('list'),
            { mid => $ctx->set_status_msg("Carrinho esvaziado.") }
        )
    );
}


sub list : Chained('base') PathPart('') Args(0) {
    my ($self, $ctx) = @_;

    $ctx->load_status_msgs;

    my @cart = @{ $ctx->session->{cart} || [] };
    my @items = map { $ctx->model('DB::Product')->find($_) } @cart;

    my $total = 0;

    for (@items) {
        $total += $_->price;
    }

    $ctx->stash(
        items => \@items,
        total => $total,
        template => 'shopping_cart.tx'
    );
}

sub checkout : Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    my $order = $ctx->model('DB::ShoppingOrder')->create({
        client_id => $ctx->session->{client}->id,
        created_at => \"now()",
    });

    for (@{ $ctx->session->{cart} || [] }) {
        $order->add_to_shopping_order_items({
            product_id => $_,
            quantity => 1,
        });
    }

    my @cart = @{ $ctx->session->{cart} || [] };
    my @items = map { $ctx->model('DB::Product')->find($_) } @cart;

    my $total = 0;

    for (@items) {
        $total += $_->price;
    }

    $ctx->session->{cart} = [];
    $ctx->stash( template => 'checkout.tx', items => \@items, total => $total );

}

__PACKAGE__->meta->make_immutable;

1;
