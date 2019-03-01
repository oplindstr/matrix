class AddShowToSignups < ActiveRecord::Migration
  def change
  	add_column :signups, :show, :boolean
  end
end
