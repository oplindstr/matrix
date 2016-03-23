class RemoveImageStuff < ActiveRecord::Migration
  def change
  	remove_column :board_members, :avatar
  	remove_column :board_members, :attachment
  end
end