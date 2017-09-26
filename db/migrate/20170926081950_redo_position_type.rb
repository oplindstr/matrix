class RedoPositionType < ActiveRecord::Migration
  def change
  	remove_column :positions, :position_type, :boolean
  	add_column :positions, :position_type, :boolean
  end
end
