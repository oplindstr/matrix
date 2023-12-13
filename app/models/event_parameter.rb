class EventParameter < ActiveRecord::Base
	belongs_to :event_parameter_type
	belongs_to :event

	has_many :signup_parameters
	has_many :event_parameter_choices

	validates :name, presence: { message: 'Nimi puuttuu' }
	validates :name, length: { in: 0..500, message: 'Anna nimi, jonka pituus on korkeintaan 500 merkkiä' }

	validate :choice_button_must_have_choices

	accepts_nested_attributes_for :signup_parameters, :event_parameter_choices, allow_destroy: true

	def choice_button_must_have_choices
		if self.event_parameter_type_id == 3 and self.event_parameter_choices.empty?
			errors.add(:event_parameter_type_id, 'Valintanapilla täytyy olla vaihtoehtoja')
		end
	end

	def get_name
		if I18n.locale == :en and self.name_eng and self.name_eng.length > 0
			return self.name_eng
		end
		return self.name
	end

end
