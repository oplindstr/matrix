class AddPositionIdToPositionMembers < ActiveRecord::Migration
	def change
		add_column :position_members, :position_id, :integer
	end
end