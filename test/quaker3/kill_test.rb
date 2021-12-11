# frozen_string_literal: true

require 'test_helper'

module Quaker3
  class KillTest < Minitest::Test
    include Quaker3::Fixture::KillTestFixture

    def test_kill_world_player
      kill = Quaker3::Kill.new KILL_WORLD_PLAYER1_MOD_TRIGGER_HURT

      assert_equal '<world>', kill.killer
      assert_equal 'Isgalamido', kill.killed
      assert_equal 'MOD_TRIGGER_HURT', kill.mode
    end

    def test_kill_player1_player2
      kill = Quaker3::Kill.new KILL_PLAYER1_PLAYER2_MOD_ROCKET

      assert_equal 'Isgalamido', kill.killer
      assert_equal 'Mocinha', kill.killed
      assert_equal 'MOD_ROCKET', kill.mode
    end

    def test_kill_himself
      kill = Quaker3::Kill.new KILL_PLAYER1_PLAYER1_MOD_ROCKET_SPLASH

      assert_equal 'Isgalamido', kill.killer
      assert_equal 'Isgalamido', kill.killed
      assert_equal 'MOD_ROCKET_SPLASH', kill.mode
    end

    def test_kill_empty_killer
      kill = Quaker3::Kill.new KILL_EMPTY_PLAYER2_MOD_ROCKET

      assert_equal '(player)', kill.killer
      assert_equal 'Isgalamido', kill.killed
      assert_equal 'MOD_ROCKET', kill.mode
    end

    def test_kill_empty_killed
      kill = Quaker3::Kill.new KILL_PLAYER1_EMPTY_MOD_ROCKET

      assert_equal 'Isgalamido', kill.killer
      assert_equal '(player)', kill.killed
      assert_equal 'MOD_ROCKET', kill.mode
    end
  end
end
