class Membership < ActiveRecord::Base
	has_one :user

	validates :year, inclusion: { in: 1991..3000, message: 'Anna vuosiluku väliltä 1991-3000' }
	validates :year, presence: { message: 'Vuosi puuttuu' }
end
