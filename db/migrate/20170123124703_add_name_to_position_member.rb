class AddNameToPositionMember < ActiveRecord::Migration
  def change
    add_column :position_members, :name, :string
  end
end
