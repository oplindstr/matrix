class News < ActiveRecord::Base
	validates :header, presence: { message: 'Otsikko puuttuu' }
	validates :header, length: { maximum: 500, message: 'Anna otsikko, jonka pituus on korkeintaan 500 merkkiä' }
	validates :text, presence: { message: 'Teksti puuttuu' }
	validates :text, length: { maximum: 25000, message: 'Anna teksti, jonka pituus on korkeintaan 25000 merkkiä' }
	validates :priority, inclusion: { in: 0..5000, message: 'Anna prioriteetiksi korkeintaan 5000' }
end
