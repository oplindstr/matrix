class Player < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  def update_ratings(ratings)
    self.expectation = ratings['Mu']
    self.deviation = ratings['Sigma']
  end
end
