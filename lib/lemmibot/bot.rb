module Lemmibot
  # A simulated toy robot on a tabletop
  class Bot
    def initialize
      @pos_x = 0
      @pos_y = 0
      @direction = :north
      @placed = false
    end

    def turn(relative_direction)
      # Rotate the bot 90 degrees to face another direction
      return false unless @placed
      case relative_direction
      when :left then change = -1
      when :right then change = 1
      end
      current_direction_index = DIRECTIONS.index(@direction)
      new_direction = DIRECTIONS.rotate(current_direction_index + change).first
      set_direction(new_direction)
    end

    def move
      # Move the bot one unit in the direction it is facing
      return false unless @placed
      case @direction
      when :north then return change_position(:y, 1)
      when :south then return change_position(:y, -1)
      when :east then return change_position(:x, 1)
      when :west then return change_position(:x, -1)
      end
    end

    def place(x, y, direction)
      # Place the bot at a specified position, facing specified direction
      return false unless set_position(:x, x) &&
                          set_position(:y, y) &&
                          set_direction(direction)
      @placed = true
      true
    end

    def report
      # Return a hash of the bot's current location and direction
      return false unless @placed
      {
        x: @pos_x,
        y: @pos_y,
        dir: @direction
      }
    end

    private

    DIRECTIONS = %i[west north east south].freeze

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
      # Check if a position is on the tabletop
      position >= 0 && position <= 4
    end

    def set_position(axis, position)
      # Set the bot to a specified valid position on specified axis
      return false unless valid_position? position
      case axis
      when :x then @pos_x = position
      when :y then @pos_y = position
      end
      true
    end

    def change_position(axis, value)
      # Alter the bot's position by given value on given axis
      new_position = if axis == :x
                       @pos_x + value
                     else
                       @pos_y + value
                     end
      set_position(axis, new_position)
    end
  end
end
