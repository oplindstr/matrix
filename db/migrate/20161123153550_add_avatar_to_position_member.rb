class AddAvatarToPositionMember < ActiveRecord::Migration
  def change
  	add_attachment :position_members, :avatar
  end
end
