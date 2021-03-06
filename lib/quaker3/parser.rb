# frozen_string_literal: true

require 'securerandom'

module Quaker3
  # Converts the Quake 3 Arena log file into Game model
  # @author Renan Gigliotti
  class Parser
    # List of Game model parsed from Quake 3 Arena Server log file
    # @return [Game] list of games
    attr_reader :games

    REGEX_COMMAND = /^.{0,7}([a-z A-Z][^:]*)/.freeze
    COMMAND_INIT_GAME = 'initgame'
    COMMAND_SHUTDOWN = 'shutdowngame'
    COMMAND_KILL = 'kill'

    # Initialize method to generate a list of games from Quake 3 Arena Server log file
    # @param file_path [String] the path of file
    def initialize(file_path)
      @games = []
      @current_game = nil
      process file_path
    end

    private

    def process(file_path)
      File.foreach file_path do |line|
        command = extract_command line
        parse command, line
      end

      shutdown
    end

    def extract_command(line)
      line[REGEX_COMMAND].strip.split[1].downcase
    end

    def parse(command, line)
      case command
      when COMMAND_INIT_GAME
        init_game
      when COMMAND_SHUTDOWN
        shutdown
      when COMMAND_KILL
        kill line
      end
    end

    def init_game
      @games.push @current_game unless @current_game.nil?
      @current_game = Quaker3::Game.new
      @current_game.id = SecureRandom.uuid
    end

    def shutdown
      @games.push @current_game unless @current_game.nil?
      @current_game = nil
    end

    def kill(line)
      @current_game.kills.push Quaker3::Kill.new(line)
    end
  end
end
