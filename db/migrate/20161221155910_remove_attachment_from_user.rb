class RemoveAttachmentFromUser < ActiveRecord::Migration
  def change
  	remove_attachment :users, :avatar
  end
end
