class AddNameToBoardMember < ActiveRecord::Migration[7.0]
  def change
    add_column :board_members, :name, :string
  end
end
