class EventParameterChoice < ActiveRecord::Base
	belongs_to :event_parameter
	
	validates :value, presence: { message: 'Arvo puuttuu' }
	validates :value, length: { maximum: 5000, message: 'Anna arvo, jonka pituus on korkeintaan 5000 merkkiä' }
end
