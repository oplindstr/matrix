class Partner < ActiveRecord::Base

	mount_uploader :image, PartnerUploader
end
