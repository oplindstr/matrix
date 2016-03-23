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

  def self.month_name(time)
    month = time.strftime('%m')
    case month
      when '01' then 'tammikuu'
      when '02' then 'helmikuu'
      when '03' then 'maaliskuu'
      when '04' then 'huhtikuu'
      when '05' then 'toukokuu'
      when '06' then 'kesäkuu'
      when '07' then 'heinäkuu'
      when '08' then 'elokuu'
      when '09' then 'syyskuu'
      when '10' then 'lokakuu'
      when '11' then 'marraskuu'
      when '12' then 'joulukuu'
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