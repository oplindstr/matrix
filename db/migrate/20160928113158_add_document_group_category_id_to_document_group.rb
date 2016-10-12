class AddDocumentGroupCategoryIdToDocumentGroup < ActiveRecord::Migration
  def change
  	add_column :document_groups, :document_group_category_id, :integer
  end
end
