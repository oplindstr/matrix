class AddShowInContactInfoToPosition < ActiveRecord::Migration
  def change
  	add_column :positions, :show_in_contact_info, :boolean
  end
end
