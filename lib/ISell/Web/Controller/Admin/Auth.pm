package ISell::Web::Controller::Admin::Auth;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' };

sub base :Chained('/') PathPart('admin') CaptureArgs(0) {
    my ($self, $ctx) = @_;

    if (!$ctx->session->{is_admin}) {
        $ctx->res->redirect('/admin/login');
    }
}

sub login :Path('/admin/login') {
    my ($self, $ctx) = @_;

    $ctx->stash(template => 'admin/login.tx');

    return unless $ctx->req->method eq 'POST';

    my $user = $ctx->req->body_params->{login};
    my $pass = $ctx->req->body_params->{password};

    if ($user ne 'admin' || $pass ne 'admin') {
        $ctx->stash(failed => 1);
    }
    else {
        $ctx->session(is_admin => 1);
        $ctx->res->redirect('/admin/');
    }
}

sub logout :Path('/admin/logout') {
    my ($self, $ctx) = @_;

    $ctx->session_destroy();
    $ctx->res->redirect('/admin/login');
}

__PACKAGE__->meta->make_immutable;

1;
