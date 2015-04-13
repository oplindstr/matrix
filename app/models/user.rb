class User < ActiveRecord::Base

  has_secure_password

  validates :username, uniqueness: true

  has_one :player

  def to_s
    self.name
  end
end
