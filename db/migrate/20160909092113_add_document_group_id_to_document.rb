class AddDocumentGroupIdToDocument < ActiveRecord::Migration[7.0]
  def up
  	add_column :documents, :document_group_id, :integer
  end
  def down
    remove_column :documents, :document_group_id
  end
end
