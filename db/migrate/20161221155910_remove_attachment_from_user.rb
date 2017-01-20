class AddAvatarToUser2 < ActiveRecord::Migration
  def change
  	remove_attachment :users, :avatar
  end
end
