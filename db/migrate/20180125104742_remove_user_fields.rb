class RemoveUserFields < ActiveRecord::Migration
  def change
  	remove_column :users, :firstname
  	remove_column :users, :lastname
  	remove_column :users, :email
  	remove_column :users, :city
  	remove_column :users, :phonenumber
  	remove_column :users, :joined
  	remove_column :users, :hyy_member
  	remove_column :users, :mathstudent
  end
end
