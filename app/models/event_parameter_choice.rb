class EventParameterChoice < ActiveRecord::Base
	belongs_to :event_parameter
	
	validates :value, presence: { message: 'Arvo puuttuu' }
	validates :value, length: { maximum: 5000, message: 'Anna arvo, jonka pituus on korkeintaan 5000 merkkiä' }

	def get_name
		if I18n.locale == :en and self.name_eng and self.name_eng.length > 0
			return self.name_eng
		end
		return self.value
	end
end
