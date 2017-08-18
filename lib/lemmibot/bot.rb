module Lemmibot
    class Bot
        def initialize
            @pos_x = 0
            @pos_y = 0
            @direction = :north
        end
        def pos_x
            return @pos_x
        end
        def pos_y
            return @pos_y
        end
        def direction
            return @direction
        end
    end
end