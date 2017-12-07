class Position < ActiveRecord::Base
	has_many :position_members
	has_many :users, through: :position_members

	belongs_to :position_type

	validates :priority, :inclusion => 0..5000

	def current_members
	  if self.position_members.size > 0
	  	return self.position_members.where('year = ?', Time.now.year)
	  end
	end
end