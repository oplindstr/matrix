class AddSupplementaryToBoardMember < ActiveRecord::Migration
  def change
  	add_column :board_members, :supplementary, :boolean
  end
end
