class AddParticipantsToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :participants, :integer
  end
end
