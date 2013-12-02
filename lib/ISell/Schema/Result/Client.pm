use utf8;
package ISell::Schema::Result::Client;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::Client

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::EncodedColumn>

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("EncodedColumn", "InflateColumn::DateTime");

=head1 TABLE: C<client>

=cut

__PACKAGE__->table("client");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'isell.client_id_seq'

=head2 version

  data_type: 'bigint'
  is_nullable: 0

=head2 address

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 city

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 cpf

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 first_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 state

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 telephone

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "isell.client_id_seq",
  },
  "version",
  { data_type => "bigint", is_nullable => 0 },
  "address",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "city",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "cpf",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "first_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "last_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "state",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "telephone",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<client_cpf_key>

=over 4

=item * L</cpf>

=back

=cut

__PACKAGE__->add_unique_constraint("client_cpf_key", ["cpf"]);

=head2 C<client_email_key>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("client_email_key", ["email"]);

=head1 RELATIONS

=head2 shopping_orders

Type: has_many

Related object: L<ISell::Schema::Result::ShoppingOrder>

=cut

__PACKAGE__->has_many(
  "shopping_orders",
  "ISell::Schema::Result::ShoppingOrder",
  { "foreign.client_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 02:25:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OJnKxbgjCtqXIBAuOhQktw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
