class Match < ActiveRecord::Base
  has_many :hands

  accepts_nested_attributes_for :hands

  def firstPlayer
    Player.find(self.player1)
  end

  def secondPlayer
    Player.find(self.player2)
  end

  def thirdPlayer
    Player.find(self.player3)
  end

  def fourthPlayer
    Player.find(self.player4)
  end

  def winnerteam
    case self.winners
      when 1 then firstPlayer + ' ja ' + secondPlayer + ' voittivat'
      when 2 then thirdPlayer + ' ja ' + fourthPlayer + ' voittivat'
      else 'Peli on kesken'
    end
  end
end
