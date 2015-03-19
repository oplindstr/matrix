class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :match_id
      t.integer :points1
      t.integer :points2
      t.integer :declarer
      t.integer :bid
      t.integer :contract
      t.boolean :made

      t.timestamps null: false
    end
  end
end
