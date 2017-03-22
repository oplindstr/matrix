class CreateEventParameterValues < ActiveRecord::Migration
  def change
    create_table :event_parameter_values do |t|
      t.integer :event_parameter_id
      t.integer :signup_id
      t.text :value

      t.timestamps null: false
    end
  end
end
