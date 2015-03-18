# -*- coding: utf-8 -*-
# Copyright (c) 2015  Matrix ry

# TrueSkill-vahvuuslukujärjestelmä Jätkäntappajia varten.
# Toteutus Joonas Hilska <joonas.hilska@helsinki.fi>

module Jatkantappajat
  module Rating
    require 'saulabs/trueskill'

    @options = {
      :beta => 300,
      :drawprobability => 0.02,
    }

    # Päivittää in place joukkueiden ([[p1, p2], [p3, p4]])
    # Pelaajiksi otetaan hashit { 'Mu' => odotusarvo, 'Sigma' => keskihajonta }.
    module_function
    def updateRatings(teams, ranks)
      ratings1 = [ Saulabs::TrueSkill::Rating.new(teams[0][0]['Mu'], teams[0][0]['Sigma']),
                   Saulabs::TrueSkill::Rating.new(teams[0][1]['Mu'], teams[0][1]['Sigma']) ]
      ratings2 = [ Saulabs::TrueSkill::Rating.new(teams[1][0]['Mu'], teams[1][0]['Sigma']),
                   Saulabs::TrueSkill::Rating.new(teams[1][1]['Mu'], teams[1][1]['Sigma']) ]

      # Kirjasto ei kunnioita annettua rankausta, joten tehtävä vaikeamman
      # kautta.
      ratings = ranks[0] == 1 ? [ratings1, ratings2] : [ratings2, ratings1]

      graph = Saulabs::TrueSkill::FactorGraph.new(ratings, ranks, @options)

      # Pitäisi palauttaa lopputuloksen arvioitu todennäköisyys,
      # mutta ei tee sitä. Patchataan kirjasto jos jaksetaan ja halutaan
      # tehdä tällä tiedolla jotain, esimerkiksi matchmaking.
      rv = graph.update_skills

      if ranks[0] == 1
        teams[0][0]['Mu'] = ratings[0][0].mean
        teams[0][0]['Sigma'] = ratings[0][0].deviation
        teams[0][1]['Mu'] = ratings[0][1].mean
        teams[0][1]['Sigma'] = ratings[0][1].deviation

        teams[1][0]['Mu'] = ratings[1][0].mean
        teams[1][0]['Sigma'] = ratings[1][0].deviation
        teams[1][1]['Mu'] = ratings[1][1].mean
        teams[1][1]['Sigma'] = ratings[1][1].deviation
      else
        teams[0][0]['Mu'] = ratings[1][0].mean
        teams[0][0]['Sigma'] = ratings[1][0].deviation
        teams[0][1]['Mu'] = ratings[1][1].mean
        teams[0][1]['Sigma'] = ratings[1][1].deviation

        teams[1][0]['Mu'] = ratings[0][0].mean
        teams[1][0]['Sigma'] = ratings[0][0].deviation
        teams[1][1]['Mu'] = ratings[0][1].mean
        teams[1][1]['Sigma'] = ratings[0][1].deviation
      end

      rv
    end
  end
end
