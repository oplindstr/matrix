class AddAvatarColumnsToBoardMembers < ActiveRecord::Migration
  def change
  	remove_column :board_members, :attachment
    add_attachment :users, :avatar
  end
end