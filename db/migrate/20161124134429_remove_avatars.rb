class RemoveAvatars < ActiveRecord::Migration
  def change
  	remove_attachment :position_members, :avatar
  	remove_attachment :board_members, :avatar
  end
end
