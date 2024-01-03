class AddContactPersonForeignKeyToEvents < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :events, :members, column: :contact_person
  end
end
