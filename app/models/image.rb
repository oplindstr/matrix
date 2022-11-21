class Image < ActiveRecord::Base
    mount_uploader :image, AvatarUploader
end
