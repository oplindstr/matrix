class AddAttachmentToBoardMembers < ActiveRecord::Migration
  def change
  	add_column :board_members, :attachment, :string
    remove_attachment :users, :avatar
  end
end