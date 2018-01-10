class Signup < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  has_many :signup_parameters
  accepts_nested_attributes_for :signup_parameters, :allow_destroy => true

  validates :name, length: { maximum: 500, message: 'Anna nimi, jonka pituus on korkeintaan 500 merkkiä' }
  validates :email, length: { maximum: 500, message: 'Anna sähköpostiosoite, jonka pituus on korkeintaan 500 merkkiä' }
  validates :phonenumber, length: { maximum: 500, message: 'Anna puhelinnumero, jonka pituus on korkeintaan 500 merkkiä' }
  validate :name_required_for_non_members

  def to_s
  	if self.user
  	  return self.user
  	end
  	return self.name
  end

  def get_email
  	if self.user
  	  return self.user.email
  	end
  	return self.email
  end

  def get_phonenumber
  	if self.user
  	  return self.user.phonenumber
  	end
  	return self.phonenumber
  end

  def name_required_for_non_members
    if !self.user_id and (!self.name or self.name.length == 0)
      errors.add(:name, 'Ulkopuolisen ilmoittautumiseen vaaditaan nimi')
    end
  end
end
