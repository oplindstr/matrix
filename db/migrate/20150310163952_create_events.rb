class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :starttime
      t.date :endtime
      t.string :location
      t.string :type
      t.boolean :signup_required
      t.date :signup_start
      t.date :signup_end
      t.date :signup_cancellable_until

      t.timestamps null: false
    end
  end
end
