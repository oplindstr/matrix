class User < ActiveRecord::Base

  has_secure_password

  attr_accessor :skip_password_validation

  has_many :signups
  has_many :events, through: :signups
  has_many :posts

  has_one :member
  accepts_nested_attributes_for :member, allow_destroy: true

  validates :username, presence: { message: "Käyttäjätunnus on pakollinen kenttä" }
  validates :username, uniqueness: { message: "Käyttäjätunnus on jo olemassa" }
  validates :username, length: { in: 1..100, message: "Valitse käyttäjätunnus, jonka pituus on enintään 100 merkkiä" }
  validates :password, length: { maximum: 100, message: "Valitse salasana, jonka pituus on enintään 100 merkkiä" }, unless: :skip_password_validation
  validates :password, length: { minimum: 6, message: "Valitse salasana, jonka pituus on vähintään 6 merkkiä" }, unless: :skip_password_validation

  mount_uploader :avatar, AvatarUploader

  def firstname
    if self.member
      return self.member.firstname
    end
  end

  def nickname
    if self.member
      return self.member.nickname
    end
  end

  def lastname
    if self.member
      return self.member.lastname
    end
  end

  def email
    if self.member
      return self.member.email
    end
  end

  def address
    if self.member
      return self.member.address
    end
  end

  def city
    if self.member
      return self.member.city
    end
  end

  def hyy_member
    if self.member
      return self.member.hyy_member
    end
  end

  def mathstudent
    if self.member
      return self.member.mathstudent
    end
  end

  def joined
    if self.member
      return self.member.joined
    end
  end

  def full_name
    return "#{self.firstname} #{self.lastname}"
  end

  def name
    if self.nickname and self.nickname.length > 0
      return "#{nickname} #{lastname}"
    end
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

  def membership_type
    if self.mathstudent
      return 'Varsinainen jäsen'
    elsif self.hyy_member
      return 'Ulkojäsen'
    else
      return 'Kannatusjäsen'
    end
  end

  def membership(year)
    if self.member
      membership = Membership.where('member_id = ? and year = ?', self.member.id, year).first
      if membership
        return true
      end
      return false
    end
  end
end
