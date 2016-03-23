class AddAvatarToBoardMembers < ActiveRecord::Migration
  def change
    add_column :board_members, :avatar, :string
  end
end
