# Lemmibot
[![Gem Version](https://badge.fury.io/rb/lemmibot.svg)](https://badge.fury.io/rb/lemmibot) 
[![Build Status](https://travis-ci.org/ineffyble/lemmibot.svg)](https://travis-ci.org/ineffyble/lemmibot)

A toy robot with better self-preservation instincts than a lemming.

## Installation

Install the gem from [RubyGems](https://rubygems.org/):

    $ gem install lemmibot

### Compatibility

Lemmibot is continuously tested against the latest minor versions of Ruby 2.0 onwards,
and should run on any system running `ruby >= 2.0.0`.

## Usage

### Interactive

Once installed, start an interactive bot interface:

    $ lemmibot

Congratulations! You've now created your very own Lemmibot.

The bot will accept the following commands:

* `PLACE X,Y,F` (e.g. `PLACE 2,1,NORTH`) - Place the bot at the specified coordinates on the tabletop, facing the specified position.
    * The tabletop is a size of 5 units by 5 units. Coordinates are zero-indexed. Valid X and Y coordinates are 0-4.
    * Lemmibot can face the following directions: *north, south, east, west*.
    * **The bot must be placed before it will accept any other commands.**
* `MOVE` - Move the bot one unit in the currently facing direction.
* `LEFT` - Rotate the bot 90 degrees left, changing the direction the bot is facing in.
* `RIGHT` - Rotate the bot 90 degrees right, changing the direction the bot is facing in.
* `REPORT` - Print a report of the bot's current position and direction, in the format `0,1,NORTH`.

Any unrecognised or malformed commands will be silently ignored.

**Lemmibot is programmed with self-preservation routines.**  
Any commands that would result in this bot's untimely demise
(i.e. attempting to place the bot at coordinates that are not on the tabletop,
or commanding the bot to move off the table) will be silently ignored.

### Using a command script

Lemmibot can fed a list of commands from a file:

    $ lemmibot < examples/basic_move

The following scripts may be found in the `examples` directory. All examples end with a single `REPORT` command.

|      File name      |                     Description                         |    Output   |
| ------------------- | ------------------------------------------------------- | ----------- |
| `basic_move`        | Demonstrates moving Lemmibot one unit.                  | `0,1,NORTH` |
| `basic_rotate`      | Demonstrates rotating Lemmibot 90 degrees left.         | `0,0,WEST`  |
| `move_and_rotate`   | Demonstrates moving and rotating Lemmibot.              | `3,3,NORTH` |
| `self_preservation` | Demonstrates that Lemmibot will not jump off the table. | `2,4,EAST`  |

## Development

### Tools

Lemmibot uses `rake`, `rspec`, `aruba`, and `rubocop` for development and testing.

### Set up

Clone the repository from GitHub:

    $ git clone https://github.com/ineffyble/lemmibot.git

Then use the setup script to install development dependencies.

    $ cd lemmibot && ./bin/setup


### Running Lemmibot locally

To run the interactive Lemmibot interface from local source: 

    $ bundle exec ./exe/lemmibot

You may pipe in example scripts from the `examples/` directory, as per the Usage section of this README.

### Testing

Once you have some working code changes, run the RSpec test suite and Rubocop style checker:

    $ bundle exec rake

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ineffyble/lemmibot.

> "Don't *git push* me 'cause I'm close to the edge (of the tabletop)"
> ~ Lemmibot, 2017

## License

Lemmibot is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
