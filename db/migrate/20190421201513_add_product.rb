class AddProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :image

      t.timestamps null: false
    end
  end
end
