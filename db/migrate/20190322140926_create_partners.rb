class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
