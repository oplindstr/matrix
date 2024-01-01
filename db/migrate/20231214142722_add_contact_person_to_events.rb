class AddContactPersonToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :contact_person, :integer
  end
end
