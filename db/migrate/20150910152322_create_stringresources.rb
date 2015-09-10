class CreateStringresources < ActiveRecord::Migration
  def change
    create_table :stringresources do |t|
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
