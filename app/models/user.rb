class User < ActiveRecord::Base

  has_secure_password

  validates :username, uniqueness: true

  def to_s
    self.name
  end
end
