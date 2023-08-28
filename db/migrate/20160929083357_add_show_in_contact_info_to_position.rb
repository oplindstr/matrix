class AddShowInContactInfoToPosition < ActiveRecord::Migration[7.0]
  def change
  	add_column :positions, :show_in_contact_info, :boolean
  end
end
