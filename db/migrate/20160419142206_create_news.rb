class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
