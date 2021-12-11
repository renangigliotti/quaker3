require 'securerandom'

module Quaker3

  class Parser
    attr_reader :games

    REGEX_COMMAND = /^.{0,7}([a-z A-Z][^:]*)/
    COMMAND_INIT_GAME = "initgame"
    COMMAND_SHUTDOWN = "shutdowngame"
    COMMAND_KILL = "kill"

    def initialize(file)
      @games = []
      @current_game = nil
      process file
    end

    private

    def process(file)
      File.foreach(file) do |line|
        command = extract_command(line)
        parse(command, line)
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
        kill(line)
      end
    end

    def init_game
      @games.push(@current_game) unless @current_game.nil?
      @current_game = Quaker3::Game.new
      @current_game.id = SecureRandom.uuid
    end

    def shutdown
      @games.push(@current_game) unless @current_game.nil?
      @current_game = nil
    end

    def kill(line)
      @current_game.kills.push(Quaker3::Kill.new(line))
    end
  end

end