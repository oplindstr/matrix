class EventParameterType < ActiveRecord::Base
	validates :name, length: { maximum: 500 }
end
