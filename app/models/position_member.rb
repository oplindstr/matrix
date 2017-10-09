class PositionMember < ActiveRecord::Base
	belongs_to :position
	belongs_to :user

	validates :name, length: { maximum: 500 }
	validates :year, :inclusion => 1991..3000, presence: true

	mount_uploader :avatar, PositionAvatarUploader
	validates :avatar, uniqueness: true

	def get_avatar
      if self.user and self.user.avatar_url
        return self.user.avatar_url
      else
      	return self.avatar_url
      end
    end
end