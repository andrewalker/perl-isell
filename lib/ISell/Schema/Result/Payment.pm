use utf8;
package ISell::Schema::Result::Payment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::Payment

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

=head1 TABLE: C<payment>

=cut

__PACKAGE__->table("payment");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'isell.payment_id_seq'

=head2 version

  data_type: 'bigint'
  is_nullable: 0

=head2 comments

  data_type: 'text'
  is_nullable: 0

=head2 confirmed_at

  data_type: 'timestamp'
  is_nullable: 0

=head2 started_at

  data_type: 'timestamp'
  is_nullable: 0

=head2 status

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
    sequence          => "isell.payment_id_seq",
  },
  "version",
  { data_type => "bigint", is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 0 },
  "confirmed_at",
  { data_type => "timestamp", is_nullable => 0 },
  "started_at",
  { data_type => "timestamp", is_nullable => 0 },
  "status",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 shopping_order_payments

Type: has_many

Related object: L<ISell::Schema::Result::ShoppingOrderPayment>

=cut

__PACKAGE__->has_many(
  "shopping_order_payments",
  "ISell::Schema::Result::ShoppingOrderPayment",
  { "foreign.payment_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 02:25:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0dfB3+xFzJF/v8JQQYW69w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
