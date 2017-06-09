class CreateSignupParameters < ActiveRecord::Migration
  def change
    create_table :signup_parameters do |t|
      t.integer :signup_id
      t.integer :event_parameter_id
      t.string :value

      t.timestamps null: false
    end
  end
end
