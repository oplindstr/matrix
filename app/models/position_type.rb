class PositionType < ActiveRecord::Base
	validates :name, presence: { message: 'Nimi puuttuu' }
	validates :name, uniqueness: { message: 'Nimi on jo käytössä' }
	validates :name, length: { maximum: 500, message: 'Anna nimi, jonka pituus on korkeintaan 500 merkkiä' }
end
