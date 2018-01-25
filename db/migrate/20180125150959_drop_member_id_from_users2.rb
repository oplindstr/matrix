class DropMemberIdFromUsers2 < ActiveRecord::Migration
  def change
  	remove_column :users, :member_id
  end
end
