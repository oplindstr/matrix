class AddDisplayNameToDocumentGroup < ActiveRecord::Migration[7.0]
  def up
  	add_column :document_groups, :display_name, :string
  end
  def down
  	remove_column :document_groups, :display_name
  end
end
