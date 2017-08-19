require 'spec_helper'

RSpec.describe Lemmibot::Bot do
  # Tests the public functions of the Bot class
  it 'will not report until placed' do
    bot = Lemmibot::Bot.new
    expect(bot.report).to eq(false)
  end

  it 'will report location and direction' do
    bot = Lemmibot::Bot.new
    bot.place(0, 1, :north)
    expect(bot.report[:x]).to eq(0)
    expect(bot.report[:y]).to eq(1)
    expect(bot.report[:dir]).to eq(:north)
  end

  it 'can be placed facing valid directions' do
    bot = Lemmibot::Bot.new
    %i[north south east west].each do |direction|
      bot.place(0, 0, direction)
      expect(bot.report[:dir]).to eq(direction)
    end
  end

  it 'cannot be placed facing invalid directions' do
    bot = Lemmibot::Bot.new
    [:cheese, 'northwest', true].each do |direction|
      bot.place(0, 0, direction)
      # Placement will fail, so report should return false
      expect(bot.report).to eq(false)
    end
  end

  it 'can be placed at valid positions' do
    bot = Lemmibot::Bot.new
    (0..4).each do |pos_x|
      (0..4).each do |pos_y|
        bot.place(pos_x, pos_y, :north)
        expect(bot.report[:x]).to eq(pos_x)
        expect(bot.report[:y]).to eq(pos_y)
        expect(bot.report[:dir]).to eq(:north)
      end
    end
  end

  it 'cannot be placed at invalid positions' do
    bot = Lemmibot::Bot.new
    [5, 42, -10, -255].each do |position|
      # Test invalid positions for both X and Y axis, ensure report returns false
      bot.place(0, position, :north)
      expect(bot.report).to eq(false)
      bot.place(position, 0, :north)
      expect(bot.report).to eq(false)
    end
  end

  it 'will not execute commands until placed' do
    bot = Lemmibot::Bot.new
    result = bot.turn(:left)
    expect(result).to eq(false)
  end

  it 'will turn left' do
    bot = Lemmibot::Bot.new
    bot.place(0, 0, :north)
    bot.turn(:left)
    expect(bot.report[:dir]).to eq(:west)
  end

  it 'will turn right' do
    bot = Lemmibot::Bot.new
    bot.place(0, 0, :north)
    bot.turn(:right)
    expect(bot.report[:dir]).to eq(:east)
  end

  it 'will rotate 360 degrees clockwise' do
    bot = Lemmibot::Bot.new
    bot.place(0, 0, :north)
    expect(bot.report[:dir]).to eq(:north)
    bot.turn(:right)
    expect(bot.report[:dir]).to eq(:east)
    bot.turn(:right)
    expect(bot.report[:dir]).to eq(:south)
    bot.turn(:right)
    expect(bot.report[:dir]).to eq(:west)
    bot.turn(:right)
    expect(bot.report[:dir]).to eq(:north)
  end

  it 'will move to the north east corner, then 2 units west' do
    bot = Lemmibot::Bot.new
    bot.place(0, 0, :north)
    4.times do
      bot.move
    end
    bot.turn(:right) # Now facing east
    4.times do
      bot.move
    end
    expect(bot.report[:x]).to eq(4)
    expect(bot.report[:y]).to eq(4)
    bot.turn(:right) # Now facing south
    bot.turn(:right) # Now facing west
    2.times do
      bot.move
    end
    expect(bot.report[:x]).to eq(2)
    expect(bot.report[:y]).to eq(4)
  end

  it 'will not fall off in any direction' do
    # Attempt to move the bot too far in every direction,
    # ensure reported coordinates never exceed bounds of the tabletop
    bot = Lemmibot::Bot.new
    bot.place(0, 0, :north)
    4.times do
      100.times do
        bot.move
      end
      bot.turn(:right)
      expect(bot.report[:x]).to be > -1
      expect(bot.report[:y]).to be > -1
      expect(bot.report[:x]).to be < 5
      expect(bot.report[:y]).to be < 5
    end
  end
end
