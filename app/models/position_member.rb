class PositionMember < ActiveRecord::Base
	belongs_to :position
	belongs_to :user

	def avatar
	  return self.user.avatar_url
	end
end