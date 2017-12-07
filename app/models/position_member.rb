class PositionMember < ActiveRecord::Base
  belongs_to :position
  belongs_to :user

  validates :year, :inclusion => 1991..3000, presence: true
  
  validate :unique_user_and_position_in_year

  def get_avatar
    return self.user.avatar_url
  end

  def name
    return self.user.name
  end

  def unique_user_and_position_in_year
    @position_members = PositionMember.where("user_id = ? and year = ? and position_id = ?", self.user_id, self.year, self.position_id)
    if @position_members.size > 0
      errors.add(:user_id, 'Tällä henkilöllä on jo tämä virka tälle vuodelle')
    end
  end
end