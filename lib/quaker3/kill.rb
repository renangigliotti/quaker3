module Quaker3
  class Kill
    attr_reader :killer
    attr_reader :killed
    attr_reader :mode

    REGEX_KILL_DATA = /(?<=Kill:).*/.freeze
    REGEX_KILLER = /(.*)(?=killed)/.freeze
    REGEX_KILLED = /(?<=killed)(.*)(?=by)/.freeze
    REGEX_KILL_MODE = /(?<=by).*/.freeze

    def initialize(line)
      parse! line
    end

    def to_h
      {
        "killer" => @killer,
        "killed" => @killed,
        "mode" => @mode
      }
    end

    private

    def parse!(line)
      data = line[REGEX_KILL_DATA].strip.split(':')[1].strip

      @killer = data[REGEX_KILLER].strip
      @killed = data[REGEX_KILLED].strip
      @mode = data[REGEX_KILL_MODE].strip
    end
  end
end
