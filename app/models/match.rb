class Match < ActiveRecord::Base
  has_many :hands

  accepts_nested_attributes_for :hands

  validate :players_must_be_unique

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

  # Jakojärjestys 1 -> 3 -> 2 -> 4

  def players
    p = [self.player1, self.player2, self.player3, self.player4]
    Player.find(p)
  end

  def playerNames
    '' + firstPlayer.name + ',' + thirdPlayer.name + ',' + secondPlayer.name + ',' + fourthPlayer.name
  end

  def winnerteam
    case self.winners
      when 1 then firstPlayer.name + ' ja ' + secondPlayer.name + ' voittivat'
      when 2 then thirdPlayer.name + ' ja ' + fourthPlayer.name + ' voittivat'
      else 'Peli on kesken'
    end
  end

  def update_players
    ranks = Array.new
    ranks[0] = self.winners
    @player1 = Player.find(self.player1)
    @player2 = Player.find(self.player2)
    @player3 = Player.find(self.player3)
    @player4 = Player.find(self.player4)
    p1 = {'Mu' => @player1.expectation, 'Sigma' => @player1.deviation}
    p2 = {'Mu' => @player2.expectation, 'Sigma' => @player2.deviation}
    p3 = {'Mu' => @player3.expectation, 'Sigma' => @player3.deviation}
    p4 = {'Mu' => @player4.expectation, 'Sigma' => @player4.deviation}
    team1 = Array.new
    team1[0] = p1
    team1[1] = p2
    team2 = Array.new
    team2[0] = p3
    team2[1] = p4
    teams = Array.new
    teams[0] = team1
    teams[1] = team2
    new_teams = Rating.updateRatings(teams, ranks)
    @player1.update_ratings(new_teams[0][0])
    @player2.update_ratings(new_teams[0][1])
    @player3.update_ratings(new_teams[1][0])
    @player4.update_ratings(new_teams[1][1])

    @player1.save
    @player2.save
    @player3.save
    @player4.save

  end

  def players_must_be_unique
    players = [self.player1, self.player2, self.player3, self.player4]

    for i in 0 .. 3
      for j in 0 .. 3
        if i != j
          if players[i] == players[j]
            errors.add(:player1, 'players must be unique')
          end
        end
      end
    end
  end
end
