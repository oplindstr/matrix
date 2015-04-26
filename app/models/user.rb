class User < ActiveRecord::Base

  has_secure_password

  validates :username, uniqueness: true

  has_one :player
  has_many :signups
  has_many :events, through: :signups

  def to_s
    if self.firstname and self.lastname
      return self.firstname + ' ' + self.lastname
    end
    if self.firstname
      return self.firstname
    end
    if self.lastname
      return self.lastname
    end
    return nil
  end
end
