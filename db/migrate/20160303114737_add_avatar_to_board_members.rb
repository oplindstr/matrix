class AddAvatarToBoardMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :board_members, :avatar, :string
  end
end
