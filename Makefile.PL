#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install 1.02;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.

name 'ISell-Web';
all_from 'lib/ISell/Web.pm';

requires 'Catalyst::Runtime' => '5.90042';
requires 'Catalyst::Plugin::Params::Nested';
requires 'Catalyst::Plugin::Session';
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Plugin::Session::Store::File';
requires 'Catalyst::Plugin::Authentication';
requires 'Catalyst::Plugin::Authorization::Roles';
requires 'Catalyst::Authentication::Store::DBIx::Class';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Component::InstancePerContext';
requires 'Catalyst::Plugin::StatusMessage';
requires 'Catalyst::Model::Factory';
requires 'Mail::Builder::Simple';
requires 'Net::SMTP::SSL';
requires 'MIME::Base64';
requires 'Authen::SASL';
requires 'Data::Manager';
requires 'Moose';
requires 'MooseX::Types::Email';
requires 'MooseX::Types::Moose';
requires 'MooseX::Types::URI';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'DBD::Pg';
requires 'DBIx::Class';
requires 'DBIx::Class::EncodedColumn';
requires 'DBIx::Class::ResultClass::HashRefInflator';
requires 'DateTime::Format::Pg';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Text::Xslate';
requires 'Catalyst::View::Xslate';
requires 'HTML::FillInForm';
test_requires 'Test::More' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
