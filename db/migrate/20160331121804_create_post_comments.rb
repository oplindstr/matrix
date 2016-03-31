class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
