class AddAdminToPosition < ActiveRecord::Migration[7.0]
  def change
  	add_column :positions, :admin, :boolean
  end
end
