class EventParameter < ActiveRecord::Base
	belongs_to :event_parameter_type
	belongs_to :event

	has_many :signup_parameters
	has_many :event_parameter_choices

	validates :name, presence: { message: 'Nimi puuttuu' }
	validates :name, length: { in: 0..500, message: 'Anna nimi, jonka pituus on korkeintaan 500 merkkiä' }

	accepts_nested_attributes_for :signup_parameters, :event_parameter_choices, allow_destroy: true

end
