class Player < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  belongs_to :user

  def update_ratings(ratings)
    self.expectation = ratings['Mu'].round(2)
    self.deviation = ratings['Sigma'].round(2)
  end

  def placement
    Player.where("expectation-3*deviation >= ?", self.expectation-3*self.deviation).count
  end
end
