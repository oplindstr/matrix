class CreateEventParameterTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :event_parameter_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
