class AddNameToPositionMember < ActiveRecord::Migration[7.0]
  def change
    add_column :position_members, :name, :string
  end
end
