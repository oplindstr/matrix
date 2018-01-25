class ChangeUsersToMembers < ActiveRecord::Migration
  def change
  	remove_column :board_members, :user_id
  	add_column :board_members, :member_id, :integer

  	remove_column :position_members, :user_id
  	add_column :position_members, :member_id, :integer

  	remove_column :memberships, :user_id
  	add_column :memberships, :member_id, :integer
  end
end
