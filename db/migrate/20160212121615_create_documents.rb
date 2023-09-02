class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
