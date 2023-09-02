class CreateDocumentGroupCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :document_group_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
