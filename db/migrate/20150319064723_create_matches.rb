class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player1
      t.integer :player2
      t.integer :player3
      t.integer :player4
      t.integer :winners

      t.timestamps null: false
    end
  end
end
