class AddJoinedToMembers < ActiveRecord::Migration
  def change
    add_column :members, :joined, :date
  end
end
