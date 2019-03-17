class BoardMember < ActiveRecord::Base
	belongs_to :member
  has_one :user, through: :member
  
  validates :member_id, presence: { message: 'Jäsen puuttuu' }
  validates :year, inclusion: {in: 1991..3000, message: 'Anna vuosiluku väliltä 1991-3000' }
  validates :year, presence: { message: "Vuosi puuttuu" }

	mount_uploader :avatar, BoardAvatarUploader

  validate :unique_member_in_year
	
  def get_avatar
    if self.user
    	return self.user.avatar_url
    end
  end

  def name
    self.member.name
  end

  def email
    self.member.display_email
  end

  def unique_member_in_year
    if self.id
      @board_members = BoardMember.where("member_id = ? and year = ? and id != ?", self.member_id, self.year, self.id)
    else
      @board_members = BoardMember.where("member_id = ? and year = ?", self.member_id, self.year)
    end
    if @board_members.size > 0
      errors.add(:member_id, 'Tämä henkilö on jo tämän vuoden hallituksessa')
    end
  end

end