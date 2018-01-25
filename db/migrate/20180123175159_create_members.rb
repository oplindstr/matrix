class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :email
      t.string :city

      t.timestamps null: false
    end
  end
end
