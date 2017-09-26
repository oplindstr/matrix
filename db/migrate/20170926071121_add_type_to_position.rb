class AddTypeToPosition < ActiveRecord::Migration
  def change
  	add_column :positions, :position_type, :boolean
  end
end
