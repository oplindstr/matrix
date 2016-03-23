class RemoveImageStuff < ActiveRecord::Migration
  def change
  	remove_column :board_members, :attachment, :string
  end
end