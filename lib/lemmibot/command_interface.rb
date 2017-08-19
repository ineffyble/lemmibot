module Lemmibot
  # An interface for issuing commands to a Lemmibot
  # via interactive command-line or piped in scripts
  class CommandInterface
    def initialize
      @bot = Lemmibot::Bot.new
    end

    def start
      # Start a session, receiving and processing commands from standard input
      puts 'Lemmibot is awaiting your commands'
      loop do
        command = gets
        return unless command
        begin
          process_command(command.chomp)
        rescue
          # Malformed and failed commands should be ignored, so take no action
        end
      end
    end

    private

    def process_command(command)
      # Process a command string
      case command.upcase
      when /PLACE/ then place(command)
      when /MOVE/ then @bot.move
      when /LEFT/ then @bot.turn(:left)
      when /RIGHT/ then @bot.turn(:right)
      when /REPORT/ then report
      end
      # All other commands will be silently ignored
    end

    def place_arguments(command)
      # Parse arguments for a PLACE command and return them as a hash
      params_string = command.split(' ')[1]
      params = params_string.split(',')
      {
        x: params[0].to_i,
        y: params[1].to_i,
        dir: params[2].downcase.to_sym
      }
    end

    def place(command)
      args = place_arguments(command)
      @bot.place(args[:x], args[:y], args[:dir])
    end

    def report
      # Output a report of the bot's current position and direction
      report = @bot.report
      return unless report
      puts "#{report[:x]},#{report[:y]},#{report[:dir].upcase}"
    end
  end
end
