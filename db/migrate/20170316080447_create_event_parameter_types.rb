class CreateEventParameterTypes < ActiveRecord::Migration
  def change
    create_table :event_parameter_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
