class AddPriorityToProduct < ActiveRecord::Migration[7.0]
  def change
  	add_column :products, :priority, :integer
  end
end
