class Position < ActiveRecord::Base
	has_many :position_members
	has_many :users, through: :position_members

	def current_members
	  @year = self.position_members.select(:year).order(year: :desc).first.year
	  return self.position_members.where('year = ?', @year)
	end
end