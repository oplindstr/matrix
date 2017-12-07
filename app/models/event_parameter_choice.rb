class EventParameterChoice < ActiveRecord::Base
	belongs_to :event_parameter
	validates :value, presence: true, length: { maximum: 5000 }
end
