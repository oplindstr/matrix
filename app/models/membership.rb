class Membership < ActiveRecord::Base
	has_one :user
end
