class DropNameFromBoardAndPositionMembers < ActiveRecord::Migration[7.0]
  def change
  	remove_column :board_members, :name
  	remove_column :position_members, :name
  end
end
