module Lemmibot
  # A simulated toy robot on a table top
  class Bot
    VALID_DIRECTIONS = %i[north south east west].freeze
    attr_reader :pos_x
    attr_reader :pos_y
    attr_reader :direction

    def initialize
      # Set the bot's position when instantiated
      @pos_x = 0
      @pos_y = 0
      @direction = :north
    end

    def valid_direction?(direction)
      VALID_DIRECTIONS.include? direction
    end

    def face(direction)
      # Set the bot to be facing a specified valid direction
      return unless valid_direction? direction
      @direction = direction
    end

    def valid_position?(position)
      position >= 0 && position <= 4
    end

    def change_position(axis, value)
      # Alter the bot's position on the table top
      if axis == :x
        new_position = @pos_x + value
        return unless valid_position? new_position
        @pos_x = new_position
      else
        new_position = @pos_y + value
        return unless valid_position? new_position
        @pos_y = new_position
      end
    end

    def move
      # Move the bot one unit in the direction it is facing
      # TODO: Find a more elegant solution for this
      case @direction
      when :north
        change_position(:y, 1)
      when :south
        change_position(:y, -1)
      when :east
        change_position(:x, 1)
      when :west
        change_position(:x, -1)
      end
    end
  end
end
