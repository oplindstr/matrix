class AddDescrToEvent < ActiveRecord::Migration
  def change
    add_column :events, :descr, :text
  end
end
