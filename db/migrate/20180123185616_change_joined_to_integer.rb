class ChangeJoinedToInteger < ActiveRecord::Migration
  def change
  	change_column :members, :joined, :integer
  	change_column :users, :joined, :integer
  end
end
