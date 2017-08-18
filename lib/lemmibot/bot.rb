module Lemmibot
  # A simulated toy robot on a table top
  class Bot
    DIRECTIONS = %i[west north east south].freeze
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
      DIRECTIONS.include? direction
    end

    def set_direction(direction)
      # Set the bot to be facing a specified valid direction
      return unless valid_direction? direction
      @direction = direction
    end

    def valid_position?(position)
      position >= 0 && position <= 4
    end

    def set_position(axis, position)
      # Set the bot to a specified valid position on specified axis
      return unless valid_position? position
      if axis == :x
        @pos_x = position
      else
        @pos_y = position
      end
    end

    def change_position(axis, value)
      # Alter the bot's position on the table top
      new_position = if axis == :x
                       @pos_x + value
                     else
                       @pos_y + value
                     end
      set_position(axis, new_position)
    end

    def turn(relative_direction)
      # Rotate the bot 90 degrees to face another direction
      # TODO: Find a nicer way to find the new direction
      change = if relative_direction == :left
                 -1
               else
                 1
               end
      next_direction_index = DIRECTIONS.index(@direction) + change
      next_direction_index = 0 if next_direction_index > DIRECTIONS.count - 1
      new_direction = DIRECTIONS[next_direction_index]
      set_direction(new_direction)
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

    def place(x, y, direction)
      # Places the bot at a specified position, facing specified direction
      set_position(:x, x)
      set_position(:y, y)
      set_direction(direction)
    end
  end
end
