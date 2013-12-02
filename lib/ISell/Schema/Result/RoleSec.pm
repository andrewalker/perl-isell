use utf8;
package ISell::Schema::Result::RoleSec;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::RoleSec

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

=head1 TABLE: C<role_sec>

=cut

__PACKAGE__->table("role_sec");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'isell.role_sec_id_seq'

=head2 version

  data_type: 'bigint'
  is_nullable: 0

=head2 authority

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
    sequence          => "isell.role_sec_id_seq",
  },
  "version",
  { data_type => "bigint", is_nullable => 0 },
  "authority",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<role_sec_authority_key>

=over 4

=item * L</authority>

=back

=cut

__PACKAGE__->add_unique_constraint("role_sec_authority_key", ["authority"]);

=head1 RELATIONS

=head2 user_sec_role_secs

Type: has_many

Related object: L<ISell::Schema::Result::UserSecRoleSec>

=cut

__PACKAGE__->has_many(
  "user_sec_role_secs",
  "ISell::Schema::Result::UserSecRoleSec",
  { "foreign.role_sec_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_secs

Type: many_to_many

Composing rels: L</user_sec_role_secs> -> user_sec

=cut

__PACKAGE__->many_to_many("user_secs", "user_sec_role_secs", "user_sec");


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 02:25:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GI63oBkadM+8AqE4I23DnA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
