module DateHelper
  def self.weekday(time)
    day = time.strftime('%u')
    case day
      when '1' then 'Maanantai'
      when '2' then 'Tiistai'
      when '3' then 'Keskiviikko'
      when '4' then 'Torstai'
      when '5' then 'Perjantai'
      when '6' then 'Lauantai'
      when '7' then 'Sunnuntai'
    end
  end

  def self.full_date(time)
    return standard_date(time) + ' ' + time(time)
  end

  def self.abbreviated_weekday(time)
    day = time.strftime('%u')
    case day
      when '1' then 'Ma'
      when '2' then 'Ti'
      when '3' then 'Ke'
      when '4' then 'To'
      when '5' then 'Pe'
      when '6' then 'La'
      when '7' then 'Su'
    end
  end

  def self.standard_date(time)
    return time.strftime('%d.%m.%Y')
  end

  def self.year
    return Time.new.year
  end

  def self.time(time)
    return time.strftime('%R')
  end
end