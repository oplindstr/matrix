class PositionType < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, length: { maximum: 500 }
end
