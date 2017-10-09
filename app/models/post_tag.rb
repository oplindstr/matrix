class PostTag < ActiveRecord::Base
	belongs_to :post

	validates :tag, presence: true, length: { maximum: 500 }
end
