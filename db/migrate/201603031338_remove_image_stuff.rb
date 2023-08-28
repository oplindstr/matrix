class RemoveImageStuff < ActiveRecord::Migration[7.0]
  def change
  	remove_column :board_members, :attachment, :string
  end
end