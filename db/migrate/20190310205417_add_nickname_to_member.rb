class AddNicknameToMember < ActiveRecord::Migration
  def change
  	add_column :members, :nickname, :string
  end
end
