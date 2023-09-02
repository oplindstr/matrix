class CreateSignupParameters < ActiveRecord::Migration[7.0]
  def change
    create_table :signup_parameters do |t|
      t.integer :signup_id
      t.integer :event_parameter_id
      t.string :value

      t.timestamps null: false
    end
  end
end
