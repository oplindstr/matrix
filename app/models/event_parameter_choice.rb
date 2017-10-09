class EventParameterChoice < ActiveRecord::Base
	belongs_to :event_parameter
	validates :value, length: { maximum: 5000 }
end
