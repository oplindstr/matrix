class CreateNonMemberSignups < ActiveRecord::Migration
  def change
    create_table :non_member_signups do |t|
      t.integer :event_id
      t.string :name
      t.string :email
      t.string :phonenumber

      t.timestamps null: false
    end
  end
end
