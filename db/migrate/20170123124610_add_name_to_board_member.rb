class AddNameToBoardMember < ActiveRecord::Migration
  def change
    add_column :board_members, :name, :string
  end
end
