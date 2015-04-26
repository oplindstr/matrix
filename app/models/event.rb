class Event < ActiveRecord::Base
  has_many :signups
  has_many :users, through: :signups

  def full
    if self.users.count >= self.signup_limit
      return true
    end
    return false
  end

  def user_signed_up(id)
    self.users.each do |user|
      if user.id === id
        return true
      end
    end
    return false
  end
end
