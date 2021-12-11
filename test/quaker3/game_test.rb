# frozen_string_literal: true

require 'test_helper'
require 'securerandom'

module Quaker3
  class GameTest < Minitest::Test
    include Quaker3::Fixture::GameTestFixture

    def setup
      @game = Quaker3::Game.new
      @game.id = SecureRandom.uuid
      @game.kills << Quaker3::Kill.new(KILL_WORLD_PLAYER1_MOD_TRIGGER_HURT)
      @game.kills << Quaker3::Kill.new(KILL_PLAYER1_PLAYER2_MOD_ROCKET)
      @game.kills << Quaker3::Kill.new(KILL_PLAYER1_PLAYER1_MOD_ROCKET_SPLASH)
    end

    def test_game_kills
      assert_equal 3, @game.kills.length
    end

    def test_game_to_h
      game = @game.to_h

      assert_equal 3, game['total_kills']
      assert_equal 3, game['kills'].length
      assert_equal KILLS, game['kills']
    end

    def test_game_to_h_grouped
      game = @game.to_h_grouped

      assert_equal 3, game['total_kills']
      assert_equal 2, game['players'].length
      assert_equal PLAYERS, game['players']
      assert_equal 2, game['score'].length
      assert_equal SCORES, game['score']
    end

    def test_to_h_grouped_by_mode
      game = @game.to_h_grouped_by_mode

      assert_equal 3, game['total_kills']
      assert_equal 3, game['modes'].length
      assert_equal MODES, game['modes']
    end
  end
end
