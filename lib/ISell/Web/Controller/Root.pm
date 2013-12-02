package ISell::Web::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

sub default :Path {
    my ( $self, $c ) = @_;

    $self->load_default($c);
}

sub load_default {
    my ( $self, $c, $template ) = @_;

    $template ||= $c->req->path;
    $template .= '.tx';

    if (-e $c->config->{root} . '/src/' . $template) {
        $c->stash(
            template => $template,
            static_root_uri => $c->uri_for('static'),
        );
    }
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;