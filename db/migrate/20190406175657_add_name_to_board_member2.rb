class AddNameToBoardMember2 < ActiveRecord::Migration
  def change
  	add_column :board_members, :name, :string
  	add_column :position_members, :name, :string
  end
end
