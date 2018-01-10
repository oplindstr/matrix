class EventParameterType < ActiveRecord::Base
	validates :name, length: { maximum: 500, message: 'Anna nimi, jonka pituus on korkeintaan 500 merkkiä' }
end
