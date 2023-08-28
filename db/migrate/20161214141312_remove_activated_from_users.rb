class RemoveActivatedFromUsers < ActiveRecord::Migration[7.0]
  def change
  	remove_column :users, :activated
  end
end
