class AddMembersOnlyToEvent < ActiveRecord::Migration[7.0]
  def change
  	add_column :events, :members_only, :boolean
  end
end
