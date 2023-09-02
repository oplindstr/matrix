class CreateEventParameterChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :event_parameter_choices do |t|
      t.integer :event_parameter_id
      t.string :value

      t.timestamps null: false
    end
  end
end
