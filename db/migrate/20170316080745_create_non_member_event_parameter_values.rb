class CreateNonMemberEventParameterValues < ActiveRecord::Migration
  def change
    create_table :non_member_event_parameter_values do |t|
      t.integer :event_parameter_id
      t.integer :non_member_signup_id
      t.text :value

      t.timestamps null: false
    end
  end
end
