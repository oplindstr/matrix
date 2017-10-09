class SignupParameter < ActiveRecord::Base
	belongs_to :event_parameter
	belongs_to :signup
	has_one :event_parameter_type, through: :event_parameter

	validates :value, length: { maximum: 25000 }
end
