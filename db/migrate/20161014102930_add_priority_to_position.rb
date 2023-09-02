class AddPriorityToPosition < ActiveRecord::Migration[7.0]
  def change
  	add_column :positions, :priority, :integer
  end
end
