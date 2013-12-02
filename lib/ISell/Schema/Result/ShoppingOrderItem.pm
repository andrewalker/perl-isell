use utf8;
package ISell::Schema::Result::ShoppingOrderItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::ShoppingOrderItem

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

=head1 TABLE: C<shopping_order_item>

=cut

__PACKAGE__->table("shopping_order_item");

=head1 ACCESSORS

=head2 shopping_order_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 product_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 quantity

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "shopping_order_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "product_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "quantity",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</shopping_order_id>

=item * L</product_id>

=back

=cut

__PACKAGE__->set_primary_key("shopping_order_id", "product_id");

=head1 RELATIONS

=head2 product

Type: belongs_to

Related object: L<ISell::Schema::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "ISell::Schema::Result::Product",
  { id => "product_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 shopping_order

Type: belongs_to

Related object: L<ISell::Schema::Result::ShoppingOrder>

=cut

__PACKAGE__->belongs_to(
  "shopping_order",
  "ISell::Schema::Result::ShoppingOrder",
  { id => "shopping_order_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 03:33:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s7U0ghLgJjqIAY/Z8vrk4w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
