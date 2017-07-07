class EventParameter < ActiveRecord::Base
	belongs_to :event_parameter_type
	belongs_to :event

	has_many :signup_parameters
	has_many :event_parameter_choices

	accepts_nested_attributes_for :signup_parameters, :event_parameter_choices

end
