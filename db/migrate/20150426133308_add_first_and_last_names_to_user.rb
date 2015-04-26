class AddFirstAndLastNamesToUser < ActiveRecord::Migration
  def change
    rename_column :events, :name, :firstname
    add_column :events, :lastname, :string
  end
end
