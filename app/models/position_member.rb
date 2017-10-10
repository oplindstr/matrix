class PositionMember < ActiveRecord::Base
	belongs_to :position
	belongs_to :user

	validates :name, length: { maximum: 500 }
	validates :year, :inclusion => 1991..3000, presence: true

	mount_uploader :avatar, PositionAvatarUploader

	def get_avatar
	  if self.avatar_url
	    return self.avatar_url
	  end
	  if self.user and self.user.avatar_url
	    return self.user.avatar_url
	  end
  	end

  	def get_name
  	  if self.user
  	    return self.user.name
  	  else
  		return self.name
  	  end
  	end
end