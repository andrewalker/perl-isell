use utf8;
package ISell::Schema::Result::UserSecRoleSec;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ISell::Schema::Result::UserSecRoleSec

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

=head1 TABLE: C<user_sec_role_sec>

=cut

__PACKAGE__->table("user_sec_role_sec");

=head1 ACCESSORS

=head2 role_sec_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 user_sec_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "role_sec_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "user_sec_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</role_sec_id>

=item * L</user_sec_id>

=back

=cut

__PACKAGE__->set_primary_key("role_sec_id", "user_sec_id");

=head1 RELATIONS

=head2 role_sec

Type: belongs_to

Related object: L<ISell::Schema::Result::RoleSec>

=cut

__PACKAGE__->belongs_to(
  "role_sec",
  "ISell::Schema::Result::RoleSec",
  { id => "role_sec_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user_sec

Type: belongs_to

Related object: L<ISell::Schema::Result::UserSec>

=cut

__PACKAGE__->belongs_to(
  "user_sec",
  "ISell::Schema::Result::UserSec",
  { id => "user_sec_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-12-02 02:25:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GVML+xfHDaE1fTrbhl7Yow


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
