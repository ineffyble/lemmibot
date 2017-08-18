# Lemmibot

A toy robot simulator with more self-preservation instincts than a real lemming.

## Installation

Install the gem from [RubyGems](https://rubygems.org/):

    $ gem install lemmibot

## Usage

Once installed, start an interactive bot interface:

    $ lemmibot

Congratulations! You've now created your very own Lemmibot.

The bot will accept the following commands:

* `PLACE X,Y,F` (e.g. `PLACE 2,1,NORTH`) - Places the bot at the specified coordinates on the table top, facing the specified position.
* `MOVE` - Moves the bot one unit in the currently facing direction.
* `LEFT` - Rotates the bot 90 degrees left, changing the faced direction but not moving the bot.
* `RIGHT` - Rotates the bot 90 degrees right, changing the faced direction but not moving the bot.
* `REPORT` - Outputs a report of the bot's current position and direction, in the format `0,1,NORTH`.

The bot must be placed before it will accept any other commands.

Any erroneous commands (including unrecognised commands and malformed commands) will be silently ignored.

Any commands that would result in this bot's untimely demise
(e.g. placing it off the edge of the table, or attempting to move the bot off the edge of the table)
will be silently ignored.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ineffyble/lemmibot.

## License

Lemmibot is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
