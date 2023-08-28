class AddTypeToPosition < ActiveRecord::Migration[7.0]
  def change
  	add_column :positions, :position_type, :boolean
  end
end
