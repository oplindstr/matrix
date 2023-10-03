class AddNameEngToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :name_eng, :string
  end
end
