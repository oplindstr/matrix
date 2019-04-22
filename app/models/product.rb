class Product < ActiveRecord::Base

	mount_uploader :image, ProductUploader

	def show_price
	  if self.price.to_i.round(2) == self.price.round(2)
	  	return self.price.to_i
	  end
	  return self.price
	end
end
