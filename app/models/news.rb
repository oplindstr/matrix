class News < ActiveRecord::Base
	validates :header, presence: true, length: { maximum: 500 }
	validates :text, presence: true, length: { maximum: 25000 }
	validates :priority, :inclusion => 0..5000
end
