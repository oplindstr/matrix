class SignupParameter < ActiveRecord::Base
	belongs_to :event_parameter
	belongs_to :signup
	has_one :event_parameter_type, through: :event_parameter

	validates :value, length: { maximum: 500, message: 'Lisätiedot voivat olla korkeintaan 500 merkkiä pitkiä' }
	validate :required_parameter_cannot_be_empty

	def required_parameter_cannot_be_empty
	  if self.event_parameter.required and (!self.value or self.value.length == 0 or ((self.event_parameter_type.id == 2) and (self.value == '0')))
	  	errors.add(:id, "Täytä pakolliset kentät")
	  end
	end
end
