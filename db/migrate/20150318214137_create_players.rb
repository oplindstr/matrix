class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.float :expectation
      t.float :deviation

      t.timestamps null: false
    end
  end
end
