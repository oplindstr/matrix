class Setting < ActiveRecord::Base
	validates :setting, presence: true, length: { maximum: 500 }
	validates :value, presence: true, length: { maximum: 25000 }
	validates :descr, presence: true, length: { maximum: 500 }
end
