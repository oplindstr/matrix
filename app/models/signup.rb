class Signup < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def to_s
  	if self.user
  	  return self.user
  	end
  	return self.name
  end
end
