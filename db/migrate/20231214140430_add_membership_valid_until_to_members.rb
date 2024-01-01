class AddMembershipValidUntilToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :membership_valid_until, :integer
  end
end
