class AddMemberLevelsToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :hyy_member, :boolean
  	add_column :members, :mathstudent, :boolean
  end
end
