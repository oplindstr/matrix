class AddParticipantsToEvent < ActiveRecord::Migration[7.0]
  def change
  	add_column :events, :participants, :integer
  end
end
