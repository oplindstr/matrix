class Member < ActiveRecord::Base
  belongs_to :user

  has_many :board_members
  has_many :position_members
  has_many :positions, through: :position_members
  has_many :memberships

  validates :firstname, presence: { message: "Etunimi on pakollinen kenttä" }
  validates :firstname, length: { in: 1..100, message: "Valitse etunimi, jonka pituus on enintään 100 merkkiä" }
  validates :lastname, presence: { message: "Sukunimi on pakollinen kenttä" }
  validates :lastname, length: { in: 1..100, message: "Valitse sukunimi, jonka pituus on enintään 100 merkkiä" }
  validates :email, uniqueness: { message: "Antamasi sähköpostiosoite on jo käytössä" }
  validates :email, length: { maximum: 100, message: "Valitse sähköpostiosoite, jonka pituus on enintään 100 merkkiä" }
  validates :address, length: { maximum: 200, message: "Valitse osoite, jonka pituus on 200 merkkiä tai alle" }
  validates :city, length: { maximum: 100, message: "Valitse kotikunta, jonka pituus on 100 merkkiä tai alle" }

  def name
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

  def membership(year)
    membership = Membership.where('member_id = ? and year = ?', self.id, year).first
    if membership
      return true
    end
    return false
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

  def get_avatar
    if self.user
      return self.user.avatar_url
    end
  end
end
