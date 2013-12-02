use utf8;
package ISell::Schema::Result::UserSec;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::UserSec

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

=head1 TABLE: C<user_sec>

=cut

__PACKAGE__->table("user_sec");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'isell.user_sec_id_seq'

=head2 version

  data_type: 'bigint'
  is_nullable: 0

=head2 account_expired

  data_type: 'boolean'
  is_nullable: 0

=head2 account_locked

  data_type: 'boolean'
  is_nullable: 0

=head2 enabled

  data_type: 'boolean'
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 password_expired

  data_type: 'boolean'
  is_nullable: 0

=head2 username

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
    sequence          => "isell.user_sec_id_seq",
  },
  "version",
  { data_type => "bigint", is_nullable => 0 },
  "account_expired",
  { data_type => "boolean", is_nullable => 0 },
  "account_locked",
  { data_type => "boolean", is_nullable => 0 },
  "enabled",
  { data_type => "boolean", is_nullable => 0 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "password_expired",
  { data_type => "boolean", is_nullable => 0 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<user_sec_username_key>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("user_sec_username_key", ["username"]);

=head1 RELATIONS

=head2 user_sec_role_secs

Type: has_many

Related object: L<ISell::Schema::Result::UserSecRoleSec>

=cut

__PACKAGE__->has_many(
  "user_sec_role_secs",
  "ISell::Schema::Result::UserSecRoleSec",
  { "foreign.user_sec_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 role_secs

Type: many_to_many

Composing rels: L</user_sec_role_secs> -> role_sec

=cut

__PACKAGE__->many_to_many("role_secs", "user_sec_role_secs", "role_sec");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 02:25:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nqhexK7qblcapACqbBZ/yQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
