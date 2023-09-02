class FixEventNameMistake < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :firstname, :name
    remove_column :events, :lastname
  end
end
