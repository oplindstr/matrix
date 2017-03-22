class AddMembersOnlyToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :members_only, :boolean
  end
end
