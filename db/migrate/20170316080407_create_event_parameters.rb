class CreateEventParameters < ActiveRecord::Migration[7.0]
  def change
    create_table :event_parameters do |t|
      t.integer :event_id
      t.string :name
      t.integer :event_parameter_type_id

      t.timestamps null: false
    end
  end
end
