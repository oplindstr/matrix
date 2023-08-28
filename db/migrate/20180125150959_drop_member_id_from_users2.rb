class DropMemberIdFromUsers2 < ActiveRecord::Migration[7.0]
  def change
  	remove_column :users, :member_id
  end
end
