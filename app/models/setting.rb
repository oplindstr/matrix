class Setting < ActiveRecord::Base
	validates :setting, presence: { message: 'Nimi puuttuu' }
	validates :setting, length: { maximum: 500, message: 'Anna nimi, jonka pituus on korkeintaan 500 merkkiä' }
	validates :value, presence: { message: 'Arvo puuttuu' }
	validates :value, length: { maximum: 25000, message: 'Anna arvo, jonka pituus on korkeintaan 25000 merkkiä' }
	validates :descr, presence: { message: 'Kuvaus puuttuu' }
	validates :descr, length: { maximum: 500, message: 'Anna kuvaus, jonka pituus on korkeintaan 500 merkkiä' }
end
