class AddMemberIdToUsers2 < ActiveRecord::Migration[7.0]
  def change
  	add_column :users, :member_id, :integer
  end
end
