class CreateUserGroup < ActiveRecord::Migration
	def change
		create_table :user_groups do |t|
		  t.string :name
		end
	end
end