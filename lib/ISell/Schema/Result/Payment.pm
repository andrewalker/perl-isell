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

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<payment>

=cut

__PACKAGE__->table("payment");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'isell.payment_id_seq'

=head2 shopping_order_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 confirmed_at

  data_type: 'timestamp'
  is_nullable: 0

=head2 started_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 status

  data_type: 'text'
  is_nullable: 0

=head2 comments

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "isell.payment_id_seq",
  },
  "shopping_order_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "confirmed_at",
  { data_type => "timestamp", is_nullable => 0 },
  "started_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
    original      => { default_value => \"now()" },
  },
  "status",
  { data_type => "text", is_nullable => 0 },
  "comments",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 shopping_order

Type: belongs_to

Related object: L<ISell::Schema::Result::ShoppingOrder>

=cut

__PACKAGE__->belongs_to(
  "shopping_order",
  "ISell::Schema::Result::ShoppingOrder",
  { id => "shopping_order_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-04-13 19:57:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gMPGXNOyEEvQZRxXSUkg5w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
