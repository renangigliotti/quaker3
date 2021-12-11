# frozen_string_literal: true

module Quaker3
  module Fixture
    module GameTestFixture
      KILL_WORLD_PLAYER1_MOD_TRIGGER_HURT = '  20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT'
      KILL_PLAYER1_PLAYER2_MOD_ROCKET = '  22:06 Kill: 2 3 7: Isgalamido killed Mocinha by MOD_ROCKET'
      KILL_PLAYER1_PLAYER1_MOD_ROCKET_SPLASH = '  22:06 Kill: 2 3 7: Isgalamido killed Isgalamido by MOD_ROCKET_SPLASH'
      KILLS = [{ 'killer' => '<world>', 'killed' => 'Isgalamido', 'mode' => 'MOD_TRIGGER_HURT' },
               { 'killer' => 'Isgalamido', 'killed' => 'Mocinha', 'mode' => 'MOD_ROCKET' },
               { 'killer' => 'Isgalamido', 'killed' => 'Isgalamido', 'mode' => 'MOD_ROCKET_SPLASH' }].freeze
      PLAYERS = %w[Isgalamido Mocinha].freeze
      SCORES = [{ 'name' => 'Isgalamido', 'score' => 1 }, { 'name' => 'Mocinha', 'score' => 0 }].freeze
      MODES = [{ 'mode' => 'MOD_TRIGGER_HURT', 'total_kills' => 1 },
               { 'mode' => 'MOD_ROCKET', 'total_kills' => 1 },
               { 'mode' => 'MOD_ROCKET_SPLASH', 'total_kills' => 1 }].freeze
    end
  end
end
