# frozen_string_literal: true

require 'test_helper'

module Quaker3
  class ParserTest < Minitest::Test
    include Quaker3::Fixture::ParserTestFixture

    def test_file_empty
      parser = Quaker3::Parser.new file_name(FILE_EMPTY)

      assert_equal 0, parser.games.length
    end

    def test_game_empty
      parser = Quaker3::Parser.new file_name(GAME_EMPTY)

      assert_equal 1, parser.games.length
      assert_equal 0, parser.games.first.kills.length
    end

    def test_game_2_matchs
      parser = Quaker3::Parser.new file_name(GAME_2_MATCHS)

      assert_equal 2, parser.games.length
    end

    def test_game_full
      parser = Quaker3::Parser.new file_name(GAME_FULL)

      assert_equal 21, parser.games.length
    end
  end
end
