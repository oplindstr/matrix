class AddPositionIdToPositionMembers < ActiveRecord::Migration[7.0]
	def change
		add_column :position_members, :position_id, :integer
	end
end