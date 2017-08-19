module Lemmibot
  # A simulated toy robot on a table top
  class Bot
    DIRECTIONS = %i[west north east south].freeze
    attr_reader :pos_x
    attr_reader :pos_y
    attr_reader :direction
    attr_reader :placed

    def initialize
      # Set the bot's position when instantiated
      @pos_x = 0
      @pos_y = 0
      @direction = :north
      @placed = false
    end

    def valid_direction?(direction)
      DIRECTIONS.include? direction
    end

    def set_direction(direction)
      # Set the bot to be facing a specified valid direction
      return false unless valid_direction? direction
      @direction = direction
      true
    end

    def valid_position?(position)
      position >= 0 && position <= 4
    end

    def set_position(axis, position)
      # Set the bot to a specified valid position on specified axis
      return false unless valid_position? position
      if axis == :x
        @pos_x = position
      else
        @pos_y = position
      end
      true
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
      return false unless @placed
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
      return false unless @placed
      case @direction
      when :north then return change_position(:y, 1)
      when :south then return change_position(:y, -1)
      when :east then return change_position(:x, 1)
      when :west then return change_position(:x, -1)
      end
    end

    def place(x, y, direction)
      # Places the bot at a specified position, facing specified direction
      return false unless set_position(:x, x) &&
                          set_position(:y, y) &&
                          set_direction(direction)
      @placed = true
      true
    end

    def report
      # Returns a hash of the bot's current location and direction
      return false unless @placed
      {
        x: @pos_x,
        y: @pos_y,
        dir: @direction
      }
    end
  end
end
