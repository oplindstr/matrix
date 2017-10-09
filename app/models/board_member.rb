class BoardMember < ActiveRecord::Base
	belongs_to :user
  validates :year, :inclusion => 1991..3000, presence: true
  validates :supplementary, presence: true
  validates :name, length: { maximum: 100 }

	mount_uploader :avatar, BoardAvatarUploader
  validates :avatar, uniqueness: true
	
    def get_avatar
      if self.user and self.user.avatar_url
        return self.user.avatar_url
      else
      	return self.avatar_url
      end
    end

end