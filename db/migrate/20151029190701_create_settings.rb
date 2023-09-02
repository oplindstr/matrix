class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :setting
      t.text :value

      t.timestamps null: false
    end
  end
end
