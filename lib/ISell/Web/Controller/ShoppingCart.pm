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

    $ctx->res->redirect('/shopping_cart');
}

sub list : Chained('base') PathPart('') Args(0) {
    my ($self, $ctx) = @_;

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
