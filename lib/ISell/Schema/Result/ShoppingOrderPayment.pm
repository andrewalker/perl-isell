use utf8;
package ISell::Schema::Result::ShoppingOrderPayment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::ShoppingOrderPayment

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

=head1 TABLE: C<shopping_order_payment>

=cut

__PACKAGE__->table("shopping_order_payment");

=head1 ACCESSORS

=head2 shopping_order_payments_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 1

=head2 payment_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "shopping_order_payments_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 1 },
  "payment_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 1 },
);

=head1 RELATIONS

=head2 payment

Type: belongs_to

Related object: L<ISell::Schema::Result::Payment>

=cut

__PACKAGE__->belongs_to(
  "payment",
  "ISell::Schema::Result::Payment",
  { id => "payment_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 shopping_order_payment

Type: belongs_to

Related object: L<ISell::Schema::Result::ShoppingOrder>

=cut

__PACKAGE__->belongs_to(
  "shopping_order_payment",
  "ISell::Schema::Result::ShoppingOrder",
  { id => "shopping_order_payments_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 02:25:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UIKCd5/KFFylOuFcYNAvAQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
