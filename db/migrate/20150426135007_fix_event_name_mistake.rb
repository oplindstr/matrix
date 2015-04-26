class FixEventNameMistake < ActiveRecord::Migration
  def change
    rename_column :events, :firstname, :name
    remove_column :events, :lastname
  end
end
