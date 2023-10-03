class AddNameEngToEventParameters < ActiveRecord::Migration[7.0]
  def change
    add_column :event_parameters, :name_eng, :string
    add_column :event_parameter_choices, :name_eng, :string
  end
end
