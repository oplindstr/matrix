class Hand < ActiveRecord::Base
  belongs_to :match
  validates :points1, :numericality => { :less_than_or_equal_to => 440 }
  validates :points2, :numericality => { :less_than_or_equal_to => 440 }

  def self.dealer
    hands_before = Hand.where('match_id = ? AND id < ?', self.match_id, self.id).count
    dealer = hands_before % 4 + 1
    self.match.dealer_name(dealer)
  end
end
