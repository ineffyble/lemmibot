module Lemmibot
  # An interface for issuing commands to a Lemmibot via CLI/STDIN
  class CommandInterface
    def initialize
      @bot = Lemmibot::Bot.new
    end

    def start
      puts 'Lemmibot is awaiting your commands'
      loop do
        command = gets
        return unless command
        process_command(command.chomp)
      end
    end

    def process_command(command)
      case command.upcase
      when /PLACE/
        args = place_arguments(command)
        @bot.place(args[:x], args[:y], args[:dir])
      when /MOVE/ then @bot.move
      when /LEFT/ then @bot.turn(:left)
      when /RIGHT/ then @bot.turn(:right)
      when /REPORT/ then report
      end
    end

    # Parses arguments for a PLACE command and returns them as a hash
    def place_arguments(command)
      params_string = command.split(' ')[1]
      params = params_string.split(',')
      {
        x: params[0].to_i,
        y: params[1].to_i,
        dir: params[2].downcase.to_sym
      }
    end

    # Outputs a report of the bot's current position and direction
    def report
      return unless @bot.placed
      puts "#{@bot.pos_x},#{@bot.pos_y},#{@bot.direction.upcase}"
    end
  end
end
