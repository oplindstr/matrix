class AddFirstAndLastNamesToUser2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :firstname
    add_column :users, :lastname, :string
  end
end
