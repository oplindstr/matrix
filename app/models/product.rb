class Product < ActiveRecord::Base

	mount_uploader :image, ProductUploader

	def show_price
	  if self.price.to_i.round(2) == self.price.round(2)
	  	return self.price.to_i
	  end
	  return self.price
	end

	def get_name
		if I18n.locale == :en and self.name_eng and self.name_eng.length > 0
			return self.name_eng
		end
		return self.name
	end
end
