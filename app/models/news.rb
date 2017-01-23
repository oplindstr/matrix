class News < ActiveRecord::Base
	validates :header, presence: true
	validates :text, presence: true
	validates :priority, :numericality => { :greater_than_or_equal_to => 0 }
end
