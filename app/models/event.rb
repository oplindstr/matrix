class Event < ActiveRecord::Base
  has_many :signups
  has_many :users, through: :signups
  has_many :event_parameters
  has_many :event_parameter_choices, through: :event_parameters

  accepts_nested_attributes_for :event_parameters

  validates :name, presence: true, length: { minimum: 1 }
  validates :descr, presence: true, length: { minimum: 1 }
  validate :endtimes_cannot_be_before_starttimes

  def full
    if self.signups.size > 0 and self.signup_limit and self.signup_limit > 0 and self.signups.count >= self.signup_limit
      return true
    end
    return false
  end

  def empty
    return self.signups.count == 0
  end

  def get_signups
    signups = self.signups
    if signups and signups.size > 0
      return signups
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
    return self.start_date + ' ' + self.name + ', ' + self.get_signups.size.to_s
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
