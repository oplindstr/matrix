class Hand < ActiveRecord::Base
  belongs_to :match

  def self.dealer
    hands_before = Hand.where('match_id = ? AND id < ?', self.match_id, self.id).count
    dealer = hands_before % 4 + 1
    self.match.dealer_name(dealer)
  end
end
