package ISell::Schema::ResultSet::Product;
use Moose;
use namespace::autoclean;
extends 'DBIx::Class::ResultSet';

sub list {
    my ($self, $p) = @_;

    my $search = {};
    my $opts = {
        page => ($p->{page} || 1),
        rows => ($p->{rows} || 9),
    };
    my $rs = $self;

    if (!$p->{private}) {
        $search->{amount_in_stock} = { '>', 0 };
    }

    if (my $o = $p->{sort}) {
        if (substr($o, 0, 1) eq '-') {
            $opts->{order_by} = { -desc => substr $o, 1 };
        }
        else {
            $opts->{order_by} = { -asc => substr $o, 1 };
        }
    }

    if (my $t = $p->{term}) {
        $search->{-or} = [
            { name => { -ilike => "%${t}%" } },
            { description => { -ilike => "%${t}%" } },
        ];
    }

    if (my $id = $p->{category_id}) {
        if (!ref $id) {
            $rs = $rs->search({ category_id => $id });
        }
        else {
            $rs = $rs->search({ category_id => { -in => $id } });
        }
    }

    if (my $price = $p->{price_from}) {
        $rs = $rs->search({ price => { '>=' => $price } });
    }

    if (my $price = $p->{price_to}) {
        $rs = $rs->search({ price => { '<=' => $price } });
    }

    my $result = $rs->search($search, $opts);

    return {
        products => [$result->all],
        pager    => $result->pager,
    };
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;
