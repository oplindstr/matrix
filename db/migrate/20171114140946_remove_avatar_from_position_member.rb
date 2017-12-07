class RemoveAvatarFromPositionMember < ActiveRecord::Migration
  def change
  	remove_column :position_members, :avatar
  end
end
