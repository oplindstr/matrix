class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string
    add_column :users, :city, :string
    add_column :users, :phonenumber, :string
    add_column :users, :joined, :datetime
    add_column :users, :hyy_member, :boolean
    add_column :users, :mathstudent, :boolean
  end
end
