require 'rails_helper'

describe "Date Helper" do

  it "gives correct weekdays for dates" do
    date = '2015-05-10'.to_time
    expect(DateHelper.weekday(date)).to eq("Sunnuntai")
    expect(DateHelper.abbreviated_weekday(date)).to eq("Su")

    date = '2015-05-11'.to_time
    expect(DateHelper.weekday(date)).to eq("Maanantai")
    expect(DateHelper.abbreviated_weekday(date)).to eq("Ma")

    date = '2015-05-12'.to_time
    expect(DateHelper.weekday(date)).to eq("Tiistai")
    expect(DateHelper.abbreviated_weekday(date)).to eq("Ti")

    date = '2015-05-13'.to_time
    expect(DateHelper.weekday(date)).to eq("Keskiviikko")
    expect(DateHelper.abbreviated_weekday(date)).to eq("Ke")

    date = '2015-05-14'.to_time
    expect(DateHelper.weekday(date)).to eq("Torstai")
    expect(DateHelper.abbreviated_weekday(date)).to eq("To")

    date = '2015-05-15'.to_time
    expect(DateHelper.weekday(date)).to eq("Perjantai")
    expect(DateHelper.abbreviated_weekday(date)).to eq("Pe")

    date = '2015-05-16'.to_time
    expect(DateHelper.weekday(date)).to eq("Lauantai")
    expect(DateHelper.abbreviated_weekday(date)).to eq("La")
  end

  it "gives dates and times in correct format" do
    date = '2015-05-10'.to_time

    expect(DateHelper.full_date(date)).to eq("10.05.2015 00:00")
    expect(DateHelper.standard_date(date)).to eq("10.05.2015")
    expect(DateHelper.time(date)).to eq("00:00")
  end

end