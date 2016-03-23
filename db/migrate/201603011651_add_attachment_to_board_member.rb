class AddAttachmentToBoardMember < ActiveRecord::Migration
  def change
    add_column :board_members, :attachment, :string
  end
end