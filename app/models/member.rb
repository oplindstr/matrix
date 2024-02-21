class Member < ActiveRecord::Base
  belongs_to :user

  has_many :board_members
  has_many :position_members
  has_many :positions, through: :position_members
  has_many :memberships
  has_many :events, foreign_key: :contact_person

  validates :firstname, presence: { message: "Etunimi on pakollinen kenttä" }
  validates :firstname, length: { in: 1..100, message: "Valitse etunimi, jonka pituus on enintään 100 merkkiä" }
  validates :lastname, presence: { message: "Sukunimi on pakollinen kenttä" }
  validates :lastname, length: { in: 1..100, message: "Valitse sukunimi, jonka pituus on enintään 100 merkkiä" }
  validates :email, uniqueness: { message: "Antamasi sähköpostiosoite on jo käytössä" }
  validates :email, length: { maximum: 100, message: "Valitse sähköpostiosoite, jonka pituus on enintään 100 merkkiä" }
  validates :address, length: { maximum: 200, message: "Valitse osoite, jonka pituus on 200 merkkiä tai alle" }
  validates :city, length: { maximum: 100, message: "Valitse kotikunta, jonka pituus on 100 merkkiä tai alle" }

  def name
    if self.nickname and self.nickname.length > 0
      return "#{nickname} #{lastname}"
    end
    return "#{firstname} #{lastname}"
  end

  def full_name
    return "#{firstname} #{lastname}"
  end

  def username
    if self.user
      return self.user.username
    end
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

  def event_contact_info
    if self.tg_nick and not self.tg_nick.empty?
      return "#{self.full_name} (#{self.tg_nick})"
    end
    return self.full_name
  end

  def priority_in_board_member_list(year)
    @minimum = self.positions_by_year(year).minimum(:priority)
    if @minimum
      return @minimum
    else
      return 100
    end
  end

  def positions_by_year(year)
    positions = self.positions&.where('position_members.year = ?', year)&.uniq
    if positions.length > 0
      return positions.sort_by(&:priority)
    end
    return positions
  end

  def to_s
    if self.nickname and self.nickname.length > 0
      return self.nickname + ' ' + self.lastname
    end
    return self.firstname + ' ' + self.lastname
  end

  def membership(year)
    membership = Membership.where('member_id = ? and year = ?', self.id, year).first
    if membership
      return true
    end
    return false
  end

  def membership_type
    if self.new_member
      return 'Uusi jäsen'
    elsif self.mathstudent
      return 'Varsinainen jäsen'
    elsif self.hyy_member
      return 'Ulkojäsen'
    else
      return 'Kannatusjäsen'
    end
  end

  def get_avatar
    if self.user
      return self.user.avatar_url
    end
  end

  def new_member
    membership = Membership.where('member_id = ?', self.id).first
    if membership
      return false
    end
    return true
  end
end
