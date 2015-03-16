class CreateHpStatistics < ActiveRecord::Migration
  def change
    create_table :hp_statistics do |t|
      t.integer :u_id
      t.float :expectation
      t.float :deviation
      t.float :assurity

      t.timestamps null: false
    end
  end
end
