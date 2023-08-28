class AddAttachmentToBoardMember < ActiveRecord::Migration[7.0]
  def change
    add_column :board_members, :attachment, :string
  end
end