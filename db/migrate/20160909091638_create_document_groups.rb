class CreateDocumentGroups < ActiveRecord::Migration
  def change
    create_table :document_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
