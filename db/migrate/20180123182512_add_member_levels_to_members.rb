class AddMemberLevelsToMembers < ActiveRecord::Migration[7.0]
  def change
  	add_column :members, :hyy_member, :boolean
  	add_column :members, :mathstudent, :boolean
  end
end
