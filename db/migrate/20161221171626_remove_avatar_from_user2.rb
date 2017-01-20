class RemoveAvatarFromUser2 < ActiveRecord::Migration
  def change
  	remove_attachment :users, :avatar
  end
end
