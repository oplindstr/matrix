class AddSupplementaryToBoardMember < ActiveRecord::Migration[7.0]
  def change
  	add_column :board_members, :supplementary, :boolean
  end
end
