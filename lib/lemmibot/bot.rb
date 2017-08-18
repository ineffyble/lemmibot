module Lemmibot
  # A simulated toy robot
  class Bot
    attr_reader :pos_x
    attr_reader :pos_y
    attr_reader :direction

    def initialize
      @pos_x = 0
      @pos_y = 0
      @direction = :north
    end
  end
end
