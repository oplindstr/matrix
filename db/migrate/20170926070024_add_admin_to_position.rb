class AddAdminToPosition < ActiveRecord::Migration
  def change
  	add_column :positions, :admin, :boolean
  end
end
