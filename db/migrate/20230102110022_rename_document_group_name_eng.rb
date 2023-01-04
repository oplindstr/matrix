class RenameDocumentGroupNameEng < ActiveRecord::Migration
  def change
    rename_column :document_groups, :name_eng, :display_name_eng
  end
end
