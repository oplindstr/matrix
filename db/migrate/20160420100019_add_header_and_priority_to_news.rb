class AddHeaderAndPriorityToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :header, :text
    add_column :news, :priority, :integer
  end

  def self.down
  	remove_column :news, :priority
    remove_column :news, :header
  end
end
