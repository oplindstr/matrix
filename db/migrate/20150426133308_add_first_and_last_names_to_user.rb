class AddFirstAndLastNamesToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :name, :firstname
    add_column :events, :lastname, :string
  end
end
