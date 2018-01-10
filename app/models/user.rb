class User < ActiveRecord::Base

  has_secure_password

  attr_accessor :skip_password_validation

  validates :username, presence: { message: "Käyttäjätunnus on pakollinen kenttä" }
  validates :username, uniqueness: { message: "Käyttäjätunnus on jo olemassa" }
  validates :username, length: { in: 1..100, message: "Valitse käyttäjätunnus, jonka pituus on enintään 100 merkkiä" }
  validates :firstname, presence: { message: "Etunimi on pakollinen kenttä" }
  validates :firstname, length: { in: 1..100, message: "Valitse etunimi, jonka pituus on enintään 100 merkkiä" }
  validates :lastname, presence: { message: "Sukunimi on pakollinen kenttä" }
  validates :lastname, length: { in: 1..100, message: "Valitse sukunimi, jonka pituus on enintään 100 merkkiä" }
  validates :email, uniqueness: { message: "Antamasi sähköpostiosoite on jo käytössä" }
  validates :email, length: { maximum: 100, message: "Valitse sähköpostiosoite, jonka pituus on enintään 100 merkkiä" }
  validates :password, length: { maximum: 100, message: "Valitse salasana, jonka pituus on enintään 100 merkkiä" }, unless: :skip_password_validation
  validates :password, length: { minimum: 6, message: "Valitse salasana, jonka pituus on vähintään 6 merkkiä" }, unless: :skip_password_validation
  validates :city, length: { maximum: 100, message: "Valitse kotikunta, jonka pituus on 100 merkkiä tai alle" }

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
    if self.email and self.email.length > 0
      return self.email.gsub!("@", " (at) ")
    end
    return nil
  end

  def info_with_email
    if self.email and self.email.length > 0
      return self.name + ' (' + display_email + ')'
    end
    return self.name
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

  def membership(year)
    membership = Membership.where('user_id = ? and year = ?', self.id, year).first
    if membership
      return true
    end
    return false
  end
end
