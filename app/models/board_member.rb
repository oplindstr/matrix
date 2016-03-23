class BoardMember < ActiveRecord::Base
	belongs_to :user

    mount_uploader :avatar, AvatarUploader

    def avatar
    	
    end
end