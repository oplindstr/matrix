class MoveUserMemberReference < ActiveRecord::Migration[7.0]
  def change
  	remove_column :users, :member_id
  	add_column :members, :user_id, :integer
  end
end
