class Event < ActiveRecord::Base
  has_many :signups
  has_many :users, through: :signups

  validates :name, presence: true, length: { minimum: 1 }
  validates :descr, presence: true, length: { minimum: 1 }
  validate :endtimes_cannot_be_before_starttimes

  def full
    if self.users.count >= self.signup_limit
      return true
    end
    return false
  end

  def empty
    return self.users.count == 0
  end

  def get_participants
    users = self.users.size
    if users and users > 0
      return users
    end
    participants = self.participants
    if participants
      return self.participants
    end
    return 0
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

  def start_date
    starttime = self.starttime
    return starttime.day.to_s + '.' + starttime.month.to_s + '.'
  end

  def calendar_short_info
    return self.start_date + ' ' + self.name + ', ' + self.get_participants.to_s
  end

  def getSignup(user_id)
    Signup.where('event_id = ? and user_id = ?', self.id, user_id).first
  end

  def signup_cancellable
    return Time.now <= self.signup_cancellable_until
  end

  def endtimes_cannot_be_before_starttimes
    if self.endtime and self.starttime and self.endtime < self.starttime
      errors.add(:starttime, "Tapahtuma ei voi loppua ennen kuin se alkaa")
    end

    if self.signup_end and self.signup_start and self.signup_end < self.signup_start
      errors.add(:signup_start, "Ilmoittautuminen ei voi loppua ennen kuin se alkaa")
    end
  end
end
