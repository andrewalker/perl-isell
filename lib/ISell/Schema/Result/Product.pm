use utf8;
package ISell::Schema::Result::Product;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::Product

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

=head1 TABLE: C<product>

=cut

__PACKAGE__->table("product");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'isell.product_id_seq'

=head2 version

  data_type: 'bigint'
  is_nullable: 0

=head2 amount_in_stock

  data_type: 'integer'
  is_nullable: 0

=head2 category_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 image_url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 price

  data_type: 'real'
  is_nullable: 0

=head2 year

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "isell.product_id_seq",
  },
  "version",
  { data_type => "bigint", is_nullable => 0 },
  "amount_in_stock",
  { data_type => "integer", is_nullable => 0 },
  "category_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "image_url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "price",
  { data_type => "real", is_nullable => 0 },
  "year",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 category

Type: belongs_to

Related object: L<ISell::Schema::Result::ProductCategory>

=cut

__PACKAGE__->belongs_to(
  "category",
  "ISell::Schema::Result::ProductCategory",
  { id => "category_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 shopping_order_items

Type: has_many

Related object: L<ISell::Schema::Result::ShoppingOrderItem>

=cut

__PACKAGE__->has_many(
  "shopping_order_items",
  "ISell::Schema::Result::ShoppingOrderItem",
  { "foreign.product_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 02:25:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J2UI6MMtldpaC5on9uGYEQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
