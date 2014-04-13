package ISell::Web::View::Kolon;
use utf8;
use Moose;
use Text::Xslate qw/html_builder/;
use HTML::FillInForm;
use namespace::autoclean;

extends 'Catalyst::View::Xslate';

has '+function' => (
    default => sub {
        +{ fif => \&fillinform, };
    }
);

sub fillinform {
    my ($form_values) = @_;
    return html_builder {
        my ($html) = @_;
        my $escaped = $$html;
        return HTML::FillInForm->fill( \$escaped, $form_values || {} );
    };
}

__PACKAGE__->meta->make_immutable;

1;
