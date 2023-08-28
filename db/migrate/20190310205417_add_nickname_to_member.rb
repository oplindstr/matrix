class AddNicknameToMember < ActiveRecord::Migration[7.0]
  def change
  	add_column :members, :nickname, :string
  end
end
