class Event < ActiveRecord::Base
  has_many :signups
  has_many :users, through: :signups
  has_many :event_parameters
  has_many :event_parameter_choices, through: :event_parameters

  accepts_nested_attributes_for :event_parameters, allow_destroy: true

  validates :name, presence: true, length: { in: 0..500 }
  validates :descr, presence: true, length: { maximum: 25000 }
  validates :location, length: { maximum: 100 }
  validates :event_type, length: { maximum: 100 }
  validates :starttime, presence: true
  validates :price, allow_blank: true, numericality: { less_than_or_equal_to: 500 }
  validates :signup_limit, allow_blank: true, numericality: { less_than_or_equal_to: 5000 }
  validate :endtimes_cannot_be_before_starttimes
  validate :date_ranges

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
    if (!self.signup_required)
      return false
    end
    time = Time.now
    if (!self.signup_end)
      open = time >= self.signup_start
    else
      open = (time <= self.signup_end and time >= self.signup_start)
    end
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

  def date_ranges
    @earliest = Date.new(1991)
    @latest = Date.new(3000)
    if self.starttime
      if self.starttime < @earliest
        errors.add(:starttime, "Tapahtuman alkuaika liian aikaisin")
      end
      if self.starttime > @latest
        errors.add(:starttime, "Tapahtuman alkuaika liian myöhään")
      end
    end
    if self.endtime
      if self.endtime < @earliest
        errors.add(:endtime, "Tapahtuman loppuaika liian aikaisin")
      end
      if self.endtime > @latest
        errors.add(:endtime, "Tapahtuman loppuaika liian myöhään")
      end
    end
    if self.signup_start
      if self.signup_start < @earliest
        errors.add(:signup_start, "Ilmoittautumisen alkuaika liian aikaisin")
      end
      if self.signup_start > @latest
        errors.add(:signup_start, "Ilmoittautumisen alkuaika liian myöhään")
      end
    end
    if self.signup_end
      if self.signup_end < @earliest
        errors.add(:signup_end, "Ilmoittautumisen loppuaika liian aikaisin")
      end
      if self.signup_end > @latest
        errors.add(:signup_end, "Ilmoittautumisen loppuaika liian myöhään")
      end
    end
    if self.signup_cancellable_until
      if self.signup_cancellable_until < @earliest
        errors.add(:signup_cancellable_until, "Ilmoittautumisen sitovuus liian aikaisin")
      end
      if self.signup_cancellable_until > @latest
        errors.add(:signup_cancellable_until, "Ilmoittautumisen sitovuus liian myöhään")
      end
    end
  end
end
