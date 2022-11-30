class Event < ActiveRecord::Base
  has_many :signups
  has_many :users, through: :signups
  has_many :event_parameters
  has_many :event_parameter_choices, through: :event_parameters

  accepts_nested_attributes_for :event_parameters, allow_destroy: true

  validates :name, presence: { message: 'Nimi puuttuu' }
  validates :name, length: { in: 0..500, message: 'Anna nimi, jonka pituus on korkeintaan 500 merkkiä' }
  validates :descr, presence: { message: 'Kuvaus puuttuu' }
  validates :descr, length: { maximum: 25000, message: 'Anna kuvaus, jonka pituus on korkeintaan 25000 merkkiä' } 
  validates :location, length: { maximum: 500, message: 'Anna paikka, jonka pituus on korkeintaan 500 merkkiä' }
  validates :event_type, length: { maximum: 100, message: 'Anna tyyppi, jonka pituus on korkeintaan 100 merkkiä' }
  validates :starttime, presence: { message: 'Alkuaika puuttuu' }
  validates :price, allow_blank: true, numericality: { less_than_or_equal_to: 1000, message: 'Anna hinnaksi korkeintaan 1000€' }
  validates :price, allow_blank: true, numericality: { greater_than_or_equal_to: 0, message: 'Anna hinnaksi vähintään 0€' }
  validates :signup_limit, allow_blank: true, numericality: { less_than_or_equal_to: 5000, message: 'Anna ilmoittautumismääräksi korkeintaan 5000' }
  validates :signup_limit, allow_blank: true, numericality: { greater_than_or_equal_to: 0, message: 'Anna ilmoittautumismääräksi vähintään 1' }
  validates :participants, allow_blank: true, numericality: { less_than_or_equal_to: 5000, message: 'Anna osallistujamääräksi korkeintaan 5000' }
  validates :participants, allow_blank: true, numericality: { greater_than_or_equal_to: 0, message: 'Anna osallistujamääräksi vähintään 0' }
  validate :validate_times
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

  def signup_count
    if self.participants
      return self.participants
    end
    signups = self.signups
    if signups and signups.size > 0
      if self.signup_limit and signups.size > self.signup_limit
        return signup_limit
      end
      return signups.size
    end
    return 0
  end

  def signup_open
    if (!self.signup_required)
      return false
    end
    if (!self.signup_end and !self.signup_start)
      return true
    end
    time = Time.now
    if (!self.signup_end and self.signup_start)
      open = time >= self.signup_start
    elsif (!self.signup_start and self.signup_end)
      open = time <= self.signup_end
    else
      open = (time >= self.signup_start and time <= self.signup_end)
    end
    return open
  end

  def signup_started
    if (!self.signup_required)
      return false
    end
    if (!self.signup_start)
      return true
    else
      time = Time.now
      open = time >= self.signup_start
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
    return self.start_date + ' ' + self.name + ', ' + self.signup_count.to_s
  end

  def getSignup(user_id)
    Signup.where('event_id = ? and user_id = ?', self.id, user_id).first
  end

  def signup_cancellable
    if self.signup_cancellable_until
      return Time.now <= self.signup_cancellable_until
    end
    return true
  end

  def validate_times
    if self.endtime and self.starttime and self.endtime < self.starttime
      errors.add(:starttime, "Tapahtuma ei voi loppua ennen kuin se alkaa")
    end

    if self.signup_end and self.signup_start and self.signup_end < self.signup_start
      errors.add(:signup_start, "Ilmoittautuminen ei voi loppua ennen kuin se alkaa")
    end

    if self.signup_start and self.signup_start >= self.starttime
      errors.add(:signup_start, "Ilmoittautuminen ei voi alkaa tapahtuman jälkeen")
    end

    if self.signup_end and self.signup_end > self.starttime
      errors.add(:signup_end, "Ilmoittautuminen ei voi loppua tapahtuman jälkeen")
    end
  end

  def date_ranges
    @earliest = Date.new(1991)
    @latest = Date.new(3000)
    if self.starttime
      if self.starttime < @earliest
        errors.add(:starttime, "Tapahtuman alkuajan pitää olla vuonna 1991 tai myöhemmin")
      end
      if self.starttime > @latest
        errors.add(:starttime, "Tapahtuman alkuajan pitää olla ennen vuotta 3000")
      end
    end
    if self.endtime
      if self.endtime < @earliest
        errors.add(:endtime, "Tapahtuman loppuajan pitää olla vuonna 1991 tai myöhemmin")
      end
      if self.endtime > @latest
        errors.add(:endtime, "Tapahtuman loppuajan pitää olla ennen vuotta 3000")
      end
    end
    if self.signup_start
      if self.signup_start < @earliest
        errors.add(:signup_start, "Ilmoittautumisen alkuajan pitää olla vuonna 1991 tai myöhemmin")
      end
      if self.signup_start > @latest
        errors.add(:signup_start, "Ilmoittautumisen alkuajan pitää olla ennen vuotta 3000")
      end
    end
    if self.signup_end
      if self.signup_end < @earliest
        errors.add(:signup_end, "Ilmoittautumisen loppuajan pitää olla vuonna 1991 tai myöhemmin")
      end
      if self.signup_end > @latest
        errors.add(:signup_end, "Ilmoittautumisen loppuajan pitää olla ennen vuotta 3000")
      end
    end
    if self.signup_cancellable_until
      if self.signup_cancellable_until < @earliest
        errors.add(:signup_cancellable_until, "Ilmoittautumisen sitovuuden pitää olla vuonna 1991 tai myöhemmin")
      end
      if self.signup_cancellable_until > @latest
        errors.add(:signup_cancellable_until, "Ilmoittautumisen sitovuuden pitää olla ennen vuotta 3000")
      end
    end
  end

  def get_descr
    if I18n.locale == :en and self.descr_eng and descr_eng.strip.length > 0
      return self.descr_eng
    end
    return self.descr
  end
end
