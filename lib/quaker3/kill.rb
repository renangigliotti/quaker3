# frozen_string_literal: true

module Quaker3
  # Represents the Kill model extract from Quake 3 Arena log file
  # @author Renan Gigliotti
  class Kill
    attr_reader :killer, :killed, :mode

    REGEX_KILL_DATA = /(?<=Kill:).*/.freeze
    REGEX_KILLER = /(.*)(?=killed)/.freeze
    REGEX_KILLED = /(?<=killed)(.*)(?=by)/.freeze
    REGEX_KILL_MODE = /(?<=by).*/.freeze

    DEFAULT_NAME = '(player)'

    def initialize(line)
      parse! line
    end

    # Generate a hash that represent's a Kill model
    # @return [Hash] from kill
    def to_h
      {
        'killer' => @killer,
        'killed' => @killed,
        'mode' => @mode
      }
    end

    private

    def parse!(line)
      data = line[REGEX_KILL_DATA].strip.split(':')[1].strip

      @killer = parse_name(data[REGEX_KILLER].strip)
      @killed = parse_name(data[REGEX_KILLED].strip)
      @mode = data[REGEX_KILL_MODE].strip
    end

    def parse_name(name)
      name.nil? || name.empty? ? DEFAULT_NAME : name
    end
  end
end
