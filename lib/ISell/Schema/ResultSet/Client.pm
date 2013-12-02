package ISell::Schema::ResultSet::Client;
use Moose;
use namespace::autoclean;
extends 'DBIx::Class::ResultSet';

sub try_to_create {
    my ($self, $params) = @_;

    if (delete($params->{confirm_password}) ne $params->{password}) {
        return;
    }

    $params->{email} = $params->{login};

    return $self->create($params);
}

__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;
