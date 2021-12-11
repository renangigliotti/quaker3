module Quaker3
  class Game
    attr_accessor :id, :kills

    KILLER_WORLD = '<world>'

    def initialize
      @kills = []
    end

    def to_h
      {
        "id" => @id,
        "total_kills" => @kills.length,
        "kills" => @kills.map { |kill| kill.to_h }
      }
    end

    def to_h_grouped
      {
        "id" => @id,
        "total_kills" => @kills.length,
        "players" => players,
        "score" => score.sort { |a, b| b[:score] <=> a[:score] }
      }
    end

    def to_h_grouped_by_mode
      {
        "id" => @id,
        "total_kills" => @kills.length,
        "modes": modes
      }
    end

    private

    def players
      (@kills.filter { |kill| kill.killer != KILLER_WORLD }.map(&:killer) + @kills.filter do |kill|
        kill.killed != KILLER_WORLD
      end.map(&:killed)).uniq
    end

    def score
      players.map { |p|
        {
          "name" => p,
          "score" => kills.filter { |kill| kill.killer == p }.map { |kill| kill.killer == KILLER_WORLD ? -1 : 1 }.sum
        }
      }
    end

    def modes
      @kills.map { |kill| kill.mode }.uniq.map { |mode|
        {
          "mode" => mode,
          "total_kills" => kills.filter { |kill| kill.mode.eql? mode }.length
        }
      }
    end
  end
end
