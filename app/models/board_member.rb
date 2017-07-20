class BoardMember < ActiveRecord::Base
	belongs_to :user

	mount_uploader :avatar, AvatarUploader
	
    def get_avatar
      if self.user and self.user.avatar_url
        return self.user.avatar_url
      else
      	return self.avatar_url
      end
    end

end