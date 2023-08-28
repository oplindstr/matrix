class DefaultValueToPriorityInNews < ActiveRecord::Migration[7.0]
  def change
  	change_column :news, :priority, :integer, :default => 1
  end
end
