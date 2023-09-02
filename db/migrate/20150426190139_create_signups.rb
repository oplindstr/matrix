class CreateSignups < ActiveRecord::Migration[7.0]
  def change
    create_table :signups do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
