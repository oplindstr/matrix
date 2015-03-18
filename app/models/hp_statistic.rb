class HpStatistic < ActiveRecord::Base
  validates :hpUsername, uniqueness: true
end
