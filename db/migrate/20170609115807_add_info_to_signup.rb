class AddInfoToSignup < ActiveRecord::Migration[7.0]
  def change
  	add_column :signups, :name, :string
  	add_column :signups, :email, :string
  	add_column :signups, :phonenumber, :string
  end
end
