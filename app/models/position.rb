class Position < ActiveRecord::Base
	has_many :position_members
	has_many :users, through: :position_members

	belongs_to :position_type

	validates :name, uniqueness: true, presence: true, length: { maximum: 500 }
	validates :priority, :inclusion => 0..5000

	def current_members
	  if self.position_members
	  	@year = self.position_members.select(:year).order(year: :desc).first.year
	  	return self.position_members.where('year = ?', @year)
	  end
	end
end