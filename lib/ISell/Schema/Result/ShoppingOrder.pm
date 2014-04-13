use utf8;
package ISell::Schema::Result::ShoppingOrder;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::ShoppingOrder

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<shopping_order>

=cut

__PACKAGE__->table("shopping_order");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'isell.shopping_order_id_seq'

=head2 client_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "isell.shopping_order_id_seq",
  },
  "client_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 client

Type: belongs_to

Related object: L<ISell::Schema::Result::Client>

=cut

__PACKAGE__->belongs_to(
  "client",
  "ISell::Schema::Result::Client",
  { id => "client_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 payments

Type: has_many

Related object: L<ISell::Schema::Result::Payment>

=cut

__PACKAGE__->has_many(
  "payments",
  "ISell::Schema::Result::Payment",
  { "foreign.shopping_order_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 shopping_order_items

Type: has_many

Related object: L<ISell::Schema::Result::ShoppingOrderItem>

=cut

__PACKAGE__->has_many(
  "shopping_order_items",
  "ISell::Schema::Result::ShoppingOrderItem",
  { "foreign.shopping_order_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-04-13 19:57:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UDXCfGlUeelaSnI8igHuIQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
