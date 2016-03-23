class RemoveImageStuff < ActiveRecord::Migration
  def change
  	remove_column :board_members, :avatar, :string
  	remove_column :board_members, :attachment, :string
  end
end