class Position < ActiveRecord::Base
	has_many :position_members, dependent: :delete_all
	has_many :users, through: :position_members

	belongs_to :position_type

	validates :priority, inclusion: { in: 0..5000, message: 'Anna prioriteetiksi korkeintaan 5000' }

	def current_members
	  if self.position_members.size > 0
	  	return self.position_members.where('year = ?', Time.now.year)
	  end
	end
end