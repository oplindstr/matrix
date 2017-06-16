class EventParameter < ActiveRecord::Base
	belongs_to :event_parameter_type
	has_many :signup_parameters
	accepts_nested_attributes_for :signup_parameters
	has_many :event_parameter_choices
end
