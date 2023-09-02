class CreatePostTags < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tags do |t|
      t.integer :post_id
      t.string :tag

      t.timestamps null: false
    end
  end
end
