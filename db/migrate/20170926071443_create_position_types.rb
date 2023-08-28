class CreatePositionTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :position_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
