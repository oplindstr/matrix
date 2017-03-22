class AddRequiredToEventParameters < ActiveRecord::Migration
  def change
  	add_column :event_parameters, :required, :boolean
  end
end
