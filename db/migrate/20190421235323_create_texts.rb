class CreateTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :texts do |t|
      t.string :name
      t.text :value

      t.timestamps null: false
    end
  end
end
