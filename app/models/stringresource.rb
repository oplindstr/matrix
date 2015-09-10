class Stringresource < ActiveRecord::Base
	validates :key, uniqueness: true, presence: true
	validates :value, presence: true

end
