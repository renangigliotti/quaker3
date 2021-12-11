# frozen_string_literal: true

module Quaker3
  module Fixture
    module ParserTestFixture
      def file_name(name)
        File.dirname(__FILE__) + "/files/#{name}"
      end

      FILE_EMPTY = 'file_empty.txt'
      GAME_EMPTY = 'game_empty.txt'
      GAME_2_MATCHS = 'game_2_matchs.txt'
      GAME_FULL = 'game_full.log'
    end
  end
end
