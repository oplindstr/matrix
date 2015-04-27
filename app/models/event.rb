class Event < ActiveRecord::Base
  has_many :signups
  has_many :users, through: :signups

  def full
    if self.users.count >= self.signup_limit
      return true
    end
    return false
  end

  def empty
    return self.users.count == 0
  end

  def signup_open
    time = Time.now
    open = (time <= self.signup_end and time >= self.signup_start)
    return open
  end

  def user_signed_up(id)
    self.users.each do |user|
      if user.id === id
        return true
      end
    end
    return false
  end

  def getSignup(user_id)
    Signup.where('event_id = ? and user_id = ?', self.id, user_id).first
  end

  def signup_cancellable
    return Time.now <= self.signup_cancellable_until
  end
end
