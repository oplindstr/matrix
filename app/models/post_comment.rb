class PostComment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	validates :comment, presence: true, length: { maximum: 25000 }
end
