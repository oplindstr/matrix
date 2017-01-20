class AddPriorityToPosition < ActiveRecord::Migration
  def change
  	add_column :positions, :priority, :integer
  end
end
