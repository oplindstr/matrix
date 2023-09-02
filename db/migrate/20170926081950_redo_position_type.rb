class RedoPositionType < ActiveRecord::Migration[7.0]
  def change
  	remove_column :positions, :position_type, :boolean
  	add_column :positions, :position_type, :boolean
  end
end
