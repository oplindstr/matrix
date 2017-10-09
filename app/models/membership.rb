class Membership < ActiveRecord::Base
	has_one :user
	validates :year, :inclusion => 1991..3000, presence: true
end
