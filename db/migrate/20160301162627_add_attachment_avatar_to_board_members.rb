class AddAttachmentAvatarToBoardMembers < ActiveRecord::Migration
  def self.up
    change_table :board_members do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :board_members, :avatar
  end
end
