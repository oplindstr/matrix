class CreateBoardMemberAndPositionAndPositionMember < ActiveRecord::Migration
	def change
		create_table :board_members do |t|
		  t.integer :user_id
		  t.integer :year
		end

		create_table :positions do |t|
		  t.string :name
		end

		create_table :position_members do |t|
		  t.integer :user_id
		  t.integer :year
		end
	end
end