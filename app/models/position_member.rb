class PositionMember < ActiveRecord::Base
  belongs_to :position
  belongs_to :member
  has_one :user, through: :member

  validates :year, inclusion: { in: 1991..3000, message: 'Anna vuosi väliltä 1991-3000' }
  validates :year, presence: { message: 'Vuosi puuttuu' }
  validates :member_id, presence: { message: 'Jäsen puuttuu' }
  
  validate :unique_user_and_position_in_year

  def get_avatar
    if self.user
      return self.user.avatar_url
    end
  end

  def name
    if self.user
      return self.user.name
    end
    self.member.name
  end

  def email
    if self.user
      self.user.display_email
    end
    self.member.display_email
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