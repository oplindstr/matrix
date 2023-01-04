class AddNameEngToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :name_eng, :string
    add_column :document_groups, :name_eng, :string
    add_column :document_group_categories, :name_eng, :string
  end
end
