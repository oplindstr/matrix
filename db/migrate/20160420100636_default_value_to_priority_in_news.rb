class DefaultValueToPriorityInNews < ActiveRecord::Migration
  def change
  	change_column :news, :priority, :integer, :default => 1
  end
end
