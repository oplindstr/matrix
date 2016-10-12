class AddDisplayNameToDocumentGroup < ActiveRecord::Migration
  def up
  	add_column :document_groups, :display_name, :string
  end
  def down
  	remove_column :document_groups, :display_name
  end
end
