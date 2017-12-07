class BoardMember < ActiveRecord::Base
	belongs_to :user
  
  validates :user, presence: true
  validates :year, :inclusion => 1991..3000, presence: true

	mount_uploader :avatar, BoardAvatarUploader

  validate :unique_user_in_year
	
  def get_avatar
    if self.avatar_url
      return self.avatar_url
    end
    if self.user.avatar_url
    	return self.user.avatar_url
    end
  end

  def name
    self.user.name
  end

  def unique_user_in_year
    @board_members = BoardMember.where("user_id = ? and year = ?", self.user_id, self.year)
    if @board_members.size > 0
      errors.add(:user_id, 'Tämä henkilö on jo tämän vuoden hallituksessa')
    end
  end

end