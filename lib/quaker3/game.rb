# frozen_string_literal: true

module Quaker3
  # Represents the Game model extract from Quake 3 Arena log file
  # @author Renan Gigliotti
  class Game
    attr_accessor :id, :kills

    KILLER_WORLD = '<world>'

    def initialize
      @kills = []
    end

    # Generate a hash that represent's a Game model
    # @return [Hash] from game
    def to_h
      {
        'id' => @id,
        'total_kills' => @kills.length,
        'kills' => @kills.map(&:to_h)
      }
    end

    # Generate a hash that represent's a Game grouped statistics
    # @return [Hash] from game grouped statistics
    def to_h_grouped
      {
        'id' => @id,
        'total_kills' => @kills.length,
        'players' => players,
        'score' => score.sort { |a, b| b[:score] <=> a[:score] }
      }
    end

    # Generate a hash that represent's a Game grouped by kill mode
    # @return [Hash] from game grouped by kill mode
    def to_h_grouped_by_mode
      {
        'id' => @id,
        'total_kills' => @kills.length,
        modes: modes
      }
    end

    private

    def players
      (@kills.filter { |kill| kill.killer != KILLER_WORLD }.map(&:killer) + @kills.filter do |kill|
        kill.killed != KILLER_WORLD
      end.map(&:killed)).uniq
    end

    def score
      players.map do |p|
        {
          'name' => p,
          'score' => kills.filter { |kill| kill.killer == p }.map { |kill| kill.killer == KILLER_WORLD ? -1 : 1 }.sum
        }
      end
    end

    def modes
      @kills.map(&:mode).uniq.map do |mode|
        {
          'mode' => mode,
          'total_kills' => kills.filter { |kill| kill.mode.eql? mode }.length
        }
      end
    end
  end
end
