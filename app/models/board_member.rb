class BoardMember < ActiveRecord::Base
	belongs_to :user
  validates :year, :inclusion => 1991..3000, presence: true
  validates :name, length: { maximum: 100 }

	mount_uploader :avatar, BoardAvatarUploader

  validate :unique_user_in_year
  validate :user_or_name_required
	
  def get_avatar
    if self.avatar_url
      return self.avatar_url
    end
    if self.user and self.user.avatar_url
    	return self.user.avatar_url
    end
  end

  def unique_user_in_year
    @board_members = BoardMember.where("user_id = ? and year = ?", self.user_id, self.year)
    if @board_members.size > 0
      errors.add(:user_id, 'Tämä henkilö on jo tämän vuoden hallituksessa')
    end
  end

  def user_or_name_required
    if (!self.name or self.name.length == 0) and !self.user_id
      errors.add(:user_id, 'Anna hallituksen jäsenen käyttäjä tai nimi')
    end
  end

end