class SignupParameter < ActiveRecord::Base
	belongs_to :event_parameter
	has_one :event_parameter_type, through: :event_parameter
end
