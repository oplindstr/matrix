class UpdateContactPersonColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :contact_person, :contact_person_id
  end
end
