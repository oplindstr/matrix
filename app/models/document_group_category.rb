class DocumentGroupCategory < ActiveRecord::Base

  has_many :document_groups

  validates :name, presence: { message: 'Nimi puuttuu' }
  validates :name, uniqueness: { message: 'Nimi on jo käytössä' }
  validates :name, length: { maximum: 500, message: 'Anna nimi, jonka pituus on enintään 500 merkkiä' }

end
