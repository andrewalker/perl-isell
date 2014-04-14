package ISell::Web::Model::EmailsQueue;
use Moose;
use Carp qw/croak/;
use utf8;
use namespace::autoclean;

extends 'Catalyst::Model';

has main_receiver => ( is => 'ro' );
has main_receiver_name => ( is => 'ro' );

has mail => (
    is        => 'ro',
    writer    => '_set_mail',
    clearer   => '_clear_mail',
    predicate => 'has_mail',
    lazy      => 1,
    default   => sub { croak 'could not find Email model' },
);

sub ACCEPT_CONTEXT {
    my ( $self, $ctx ) = @_;

    $self->_clear_mail();

    $self->_set_mail( $ctx->model('Email') );

    return $self;
}

sub send_new_sale_email {
    my ( $self, $args ) = @_;

    $args->{main_receiver_name} = $self->main_receiver_name;

    $self->_send(
        to       => $self->main_receiver,
        subject  => "Venda no ECommerce - $args->{client}",
        template => 'new_sale.tx',
        vars     => $args,
    );
}

sub _send {
    my ($self, %params) = @_;

    $self->mail->send(
        to            => $params{to},
        subject       => $params{subject},
        htmltext      => [ $params{template}, ':Xslate' ],
        template_vars => $params{vars},
    );
}

1;
