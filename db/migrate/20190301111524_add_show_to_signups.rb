class AddShowToSignups < ActiveRecord::Migration[7.0]
  def change
  	add_column :signups, :show, :boolean
  end
end
