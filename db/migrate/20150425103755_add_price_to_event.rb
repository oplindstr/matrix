class AddPriceToEvent < ActiveRecord::Migration
  def change
    add_column :events, :price, :decimal
  end
end
