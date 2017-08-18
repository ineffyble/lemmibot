module Lemmibot
  # A simulated toy robot
  class Bot
    VALID_DIRECTIONS = %i[north south east west].freeze
    attr_reader :pos_x
    attr_reader :pos_y
    attr_reader :direction

    def initialize
      @pos_x = 0
      @pos_y = 0
      @direction = :north
    end

    def valid_direction?(direction)
      VALID_DIRECTIONS.include? direction
    end

    def face(direction)
      return unless valid_direction? direction
      @direction = direction
    end
  end
end
