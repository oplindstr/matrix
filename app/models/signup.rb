class Signup < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  has_many :signup_parameters
  accepts_nested_attributes_for :signup_parameters, :allow_destroy => true

  def to_s
  	if self.user
  	  return self.user
  	end
  	return self.name
  end
end
