class News < ActiveRecord::Base
	validates :priority, :numericality => { :greater_than_or_equal_to => 0 }
end
