package ISell::Web::Controller::ShoppingCart;
use Moose;
use namespace::autoclean;
use Scalar::Util qw/looks_like_number/;

BEGIN { extends 'Catalyst::Controller' };

__PACKAGE__->config(namespace => 'shopping_cart');

sub base : Chained('/') PathPrefix CaptureArgs(0) {
    my ($self, $ctx) = @_;

    if (!$ctx->session->{client}) {
        return $ctx->res->redirect('/client/login');
    }
}

# XXX: this should be POST
# No time for that.
sub add : Chained('base') Args(1) {
    my ($self, $ctx, $id) = @_;

    my %cart = %{ $ctx->session->{cart} || {} };

    $cart{$id} = {
        created_at => time(),
        quantity => 1,
    };

    $ctx->session->{cart} = \%cart;

    $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('list'),
            { mid => $ctx->set_status_msg("Item adicionado com sucesso.") }
        )
    );
}

sub update : Chained('base') Args(1) POST {
    my ($self, $ctx, $id) = @_;

    my $qty = $ctx->req->body_params->{quantity};

    if (!looks_like_number($qty) || $qty <= 0) {
        return $ctx->res->redirect(
            $ctx->uri_for(
                $self->action_for('list'),
                { mid => $ctx->set_error_msg("Quantidade inválida.") }
            )
        );
    }

    my %cart = %{ $ctx->session->{cart} || {} };

    $cart{$id}{quantity} = $qty;

    $ctx->session->{cart} = \%cart;

    return $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('list'),
            { mid => $ctx->set_status_msg("Quantidade atualizada.") }
        )
    );
}

# XXX: this should be DELETE
# No time for that.
sub remove : Chained('base') Args(1) {
    my ($self, $ctx, $id) = @_;

    my %cart = %{ $ctx->session->{cart} || {} };

    delete $cart{$id};

    $ctx->session->{cart} = \%cart;

    $ctx->res->redirect(
        $ctx->uri_for(
            $self->action_for('list'),
            { mid => $ctx->set_status_msg("Item removido com sucesso.") }
        )
    );
}

# XXX: this should be POST
# No time for that.
sub clear : Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    $ctx->session->{cart} = {};

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

    my %cart = %{ $ctx->session->{cart} || {} };
    my $i;

    my @items = map {
        $i = $ctx->model('DB::Product')->find($_);
        {
            id       => $i->id,
            name     => $i->name,
            quantity => $cart{$_}{quantity},
            price    => $i->price,
        }
      }
      sort { $cart{$a}{created_at} <=> $cart{$b}{created_at} }
      keys %cart;

    my $total = 0;

    for (@items) {
        $total += $_->{price} * $_->{quantity};
    }

    $ctx->stash(
        items => \@items,
        total => $total,
        template => 'shopping_cart.tx'
    );
}

# XXX: this should be POST
# No time for that.
sub checkout : Chained('base') Args(0) {
    my ($self, $ctx) = @_;

    my $order = $ctx->model('DB::ShoppingOrder')->create({
        client_id => $ctx->session->{client}->id,
        created_at => \"now()",
    });

    my %cart = %{ $ctx->session->{cart} || {} };
    my $i;

    my @items = map {
        $i = $ctx->model('DB::Product')->find($_);
        {
            id       => $i->id,
            name     => $i->name,
            quantity => $cart{$_}{quantity},
            price    => $i->price,
        }
      }
      sort { $cart{$a}{created_at} <=> $cart{$b}{created_at} }
      keys %cart;

    for (@items) {
        $order->add_to_shopping_order_items({
            product_id => $_->{id},
            quantity => $_->{quantity},
        });
    }

    my $total = 0;

    for (@items) {
        $total += $_->{price} * $_->{quantity};
    }

    $ctx->session->{cart} = {};
    $ctx->stash( template => 'checkout.tx', items => \@items, total => $total );
}

__PACKAGE__->meta->make_immutable;

1;
