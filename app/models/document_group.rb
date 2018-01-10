class DocumentGroup < ActiveRecord::Base

  has_many :documents
  belongs_to :document_group_category

  validates :name, presence: { message: 'Nimi puuttuu' }
  validates :name, uniqueness: { message: 'Nimi on jo käytössä' }
  validates :name, length: { maximum: 500, message: 'Anna nimi, jonka pituus on enintään 500 merkkiä' }
  validates :display_name, length: { maximum: 500, message: 'Anna lyhyt nimi, jonka pituus on enintään 500 merkkiä' }

  def to_s
  	if self.display_name
  	  self.display_name
    else
      self.name
    end
  end

  def url
    self.name.tr(' ', '+')
  end

end
