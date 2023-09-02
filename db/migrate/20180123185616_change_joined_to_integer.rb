class ChangeJoinedToInteger < ActiveRecord::Migration[7.0]
  def change
  	remove_column :members, :joined
  	add_column :members, :joined, :integer
  	remove_column :users, :joined
  	add_column :users, :joined, :integer
  end
end
