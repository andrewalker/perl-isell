package Mail::Builder::Simple::Xslate;

use strict;
use warnings;
use Text::Xslate;
use Encode;

use 5.008_008;

our $VERSION = '0.01';

sub new {
    my ( $class, $args, $vars ) = @_;

    my $self = {
        template_args => $args,
        template_vars => $vars,
    };

    return bless $self, $class;
}

sub process {
    my ( $self, $template, $source ) = @_;

    my $args = $self->{template_args};

    my $t = Text::Xslate->new($args);

    if ( $source eq 'file' ) {
        return Encode::encode( 'UTF-8',
            $t->render( $template, $self->{template_vars} ) );
    }

    if ( $source eq 'scalar' ) {
        return Encode::encode( 'UTF-8',
            $t->render_string( $$template, $self->{template_vars} ) );
    }

    # TODO
    #     # throw exception here
}

1;
