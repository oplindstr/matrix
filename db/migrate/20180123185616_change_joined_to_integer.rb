class ChangeJoinedToInteger < ActiveRecord::Migration
  def change
  	remove_column :members, :joined
  	add_column :members, :joined, :integer
  	remove_column :users, :joined
  	add_column :members, :joined, :integer
  end
end
