class PositionMember < ActiveRecord::Base
  belongs_to :position
  belongs_to :member
  has_one :user, through: :member

  validates :year, inclusion: { in: 1991..3000, message: 'Anna vuosi väliltä 1991-3000' }
  validates :year, presence: { message: 'Vuosi puuttuu' }
  
  validate :unique_user_and_position_in_year

  def get_avatar
    if self.user
      return self.user.avatar_url
    end
  end

  def get_name
    if self.member
      return self.member.name
    end
    self.name
  end

  def email
    if self.member
      return self.member.display_email
    end
  end

  def priority_in_board_member_list(year)
    if self.member
      return self.member.priority_in_board_member_list(year)
    end
    @positions = self.positions_by_year(year)
    if !@positions.empty?
      return @positions.minimum(:priority)
    end
    return 100
  end

  def positions_by_year(year)
    if self.member
      return self.member.positions_by_year(year)
    end
    return Position.joins(:position_members).where('position_members.year = ? and position_members.name = ?', year, self.name).uniq
  end
  
  def unique_user_and_position_in_year
    if self.id
      @position_members = PositionMember.where("member_id = ? and year = ? and position_id = ? and id != ?", self.member_id, self.year, self.position_id, self.id)
    else
      @position_members = PositionMember.where("member_id = ? and year = ? and position_id = ?", self.member_id, self.year, self.position_id)
    end
    if @position_members.size > 0
      errors.add(:member_id, 'Tällä henkilöllä on jo tämä virka tälle vuodelle')
    end
  end
end