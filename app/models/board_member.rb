class BoardMember < ActiveRecord::Base
	belongs_to :user
  
  validates :user, presence: { message: "Käyttäjä puuttuu" }
  validates :year, inclusion: {in: 1991..3000, message: 'Anna vuosiluku väliltä 1991-3000' }
  validates :year, presence: { message: "Vuosi puuttuu" }

	mount_uploader :avatar, BoardAvatarUploader

  validate :unique_user_in_year
	
  def get_avatar
    if self.user.avatar_url
    	return self.user.avatar_url
    end
  end

  def name
    if self.user
      self.user.name
    end
  end

  def email
    self.user.display_email
  end

  def unique_user_in_year
    if self.id
      @board_members = BoardMember.where("user_id = ? and year = ? and id != ?", self.user_id, self.year, self.id)
    else
      @board_members = BoardMember.where("user_id = ? and year = ?", self.user_id, self.year)
    end
    if @board_members.size > 0
      errors.add(:user_id, 'Tämä henkilö on jo tämän vuoden hallituksessa')
    end
  end

end