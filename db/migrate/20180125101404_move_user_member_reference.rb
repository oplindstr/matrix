class MoveUserMemberReference < ActiveRecord::Migration
  def change
  	remove_column :users, :member_id
  	add_column :members, :user_id, :integer
  end
end
