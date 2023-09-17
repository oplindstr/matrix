require 'rails_helper'

describe "Date Helper" do

  it "gives correct weekdays for dates" do
    date = '2015-05-10'.to_time
    expect(DateUtils.weekday(date)).to eq("Sunnuntai")
    expect(DateUtils.abbreviated_weekday(date)).to eq("Su")

    date = '2015-05-11'.to_time
    expect(DateUtils.weekday(date)).to eq("Maanantai")
    expect(DateUtils.abbreviated_weekday(date)).to eq("Ma")

    date = '2015-05-12'.to_time
    expect(DateUtils.weekday(date)).to eq("Tiistai")
    expect(DateUtils.abbreviated_weekday(date)).to eq("Ti")

    date = '2015-05-13'.to_time
    expect(DateUtils.weekday(date)).to eq("Keskiviikko")
    expect(DateUtils.abbreviated_weekday(date)).to eq("Ke")

    date = '2015-05-14'.to_time
    expect(DateUtils.weekday(date)).to eq("Torstai")
    expect(DateUtils.abbreviated_weekday(date)).to eq("To")

    date = '2015-05-15'.to_time
    expect(DateUtils.weekday(date)).to eq("Perjantai")
    expect(DateUtils.abbreviated_weekday(date)).to eq("Pe")

    date = '2015-05-16'.to_time
    expect(DateUtils.weekday(date)).to eq("Lauantai")
    expect(DateUtils.abbreviated_weekday(date)).to eq("La")
  end

  it "gives dates and times in correct format" do
    date = '2015-05-10'.to_time

    expect(DateUtils.full_date(date)).to eq("10.05.2015 00:00")
    expect(DateUtils.standard_date(date)).to eq("10.05.2015")
    expect(DateUtils.time(date)).to eq("00:00")
  end

end