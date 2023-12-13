module DateUtils
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

  def self.weekday_en(time)
    day = time.strftime('%u')
    case day
      when '1' then 'Monday'
      when '2' then 'Tuesday'
      when '3' then 'Wednesday'
      when '4' then 'Thursday'
      when '5' then 'Friday'
      when '6' then 'Saturday'
      when '7' then 'Sunday'
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

  def self.abbreviated_weekday_en(time)
    day = time.strftime('%u')
    case day
      when '1' then 'Mon'
      when '2' then 'Tue'
      when '3' then 'Wed'
      when '4' then 'Thu'
      when '5' then 'Fri'
      when '6' then 'Sat'
      when '7' then 'Sun'
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

  def self.month_name_en(time)
    month = time.strftime('%m')
    case month
      when '01' then 'January'
      when '02' then 'February'
      when '03' then 'March'
      when '04' then 'April'
      when '05' then 'May'
      when '06' then 'June'
      when '07' then 'July'
      when '08' then 'August'
      when '09' then 'September'
      when '10' then 'October'
      when '11' then 'November'
      when '12' then 'December'
    end
  end

  def self.standard_date(time)
    return time.strftime('%d.%m.%Y')
  end

  def self.date(time)
    return time.strftime('%d.%m.')
  end

  def self.get_year(time)
    return time.strftime('%Y')
  end

  def self.standard_date_with_weekday(time, locale)
    if (locale == :en)
      weekday_name = weekday_en(time)
    else
      weekday_name = weekday(time)
    end
    if get_year(time).to_i != self.year
      return weekday_name + ' ' + standard_date(time)
    end
    return weekday_name + ' ' + date(time)
  end

  def self.standard_time(time, locale)
    return standard_date_with_weekday(time, locale) + ' ' + time(time)
  end

  def self.standard_time2(time)
    if get_year(time).to_i != self.year
      return weekday(time) + 'na ' + standard_date(time) + ' klo ' + time(time)
    end
    return weekday(time) + 'na ' + date(time) + ' klo ' + time(time)
  end

  def self.year
    return Time.new.year
  end

  def self.time(time)
    return time.strftime('%R')
  end
end