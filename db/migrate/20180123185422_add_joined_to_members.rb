class AddJoinedToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :joined, :date
  end
end
