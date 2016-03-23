class RemoveImageStuff < ActiveRecord::Migration
  def change
  	remove_column :board_members, :avatar_file_name
  	remove_column :board_members, :avatar_content_type
  	remove_column :board_members, :avatar_file_size
  	remove_column :board_members, :avatar_updated_at
  	remove_column :board_members, :attachment
  end
end