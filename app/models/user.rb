class User < ActiveRecord::Base

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { in: 1..100 }
  validates :firstname, presence: true, length: { in: 1..100 }
  validates :lastname, presence: true, length: { in: 1..100 }
  validates :email, uniqueness: true, length: { in: 1..100 }
  validates :password, length: { maximum: 100 }
  validates :city, length: { in: 1..100 }
  validates :phonenumber, length: { maximum: 100 }

  has_many :board_members
  has_many :signups
  has_many :events, through: :signups
  has_many :posts
  has_many :position_members
  has_many :positions, through: :position_members
  has_many :memberships

  mount_uploader :avatar, AvatarUploader

  def name
    return "#{firstname} #{lastname}"
  end

  def display_email
    return self.email.gsub!("@", " (at) ")
  end

  def info_with_email
    return self.name + ' (' + display_email + ')'
  end

  def priority_in_board_member_list(year)
    @minimum = self.positions_by_year(year).minimum('priority')
    if @minimum
      return @minimum
    else
      return 100
    end
  end

  def positions_by_year(year)
    return self.positions.where('position_members.year = ?', year).uniq.order(:priority)
  end

  def to_s
    if self.firstname and self.lastname
      return self.firstname + ' ' + self.lastname
    end
    if self.firstname
      return self.firstname
    end
    if self.lastname
      return self.lastname
    end
    return nil
  end

  def signup_number(event_id)
    signup = Signup.where('event_id = ? and user_id = ?', event_id, self.id).first
    signup_id = signup.id
    return Signup.where('event_id = ? and id <= ?', event_id ,signup_id).count
  end

  def get_avatar
    return self.avatar_url
  end
end
