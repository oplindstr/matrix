class AddDescrToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :descr, :text
  end
end
