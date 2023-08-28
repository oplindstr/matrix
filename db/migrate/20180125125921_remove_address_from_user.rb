class RemoveAddressFromUser < ActiveRecord::Migration[7.0]
  def change
  	remove_column :users, :address
  end
end
