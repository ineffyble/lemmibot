require 'spec_helper'

RSpec.describe Lemmibot::Bot do
  it 'starts at 0,0,NORTH' do
    bot = Lemmibot::Bot.new
    expect(bot.pos_x).to eq(0)
    expect(bot.pos_y).to eq(0)
    expect(bot.direction).to eq(:north)
  end

  it 'recognises valid directions' do
    bot = Lemmibot::Bot.new
    %i[north south east west].each do |direction|
      expect(bot.valid_direction?(direction)).to eq(true)
    end
  end

  it 'rejects invalid directions' do
    bot = Lemmibot::Bot.new
    expect(bot.valid_direction?(:cheese)).to eq(false)
    expect(bot.valid_direction?('northwest')).to eq(false)
    expect(bot.valid_direction?(true)).to eq(false)
  end

  it 'will face north' do
    bot = Lemmibot::Bot.new
    bot.set_direction(:east)
    expect(bot.direction).to eq(:east)
  end

  it 'will not face southwest' do
    bot = Lemmibot::Bot.new
    bot.set_direction(:south)
    bot.set_direction(:southwest)
    expect(bot.direction).to eq(:south)
  end

  it 'recognises valid positions' do
    bot = Lemmibot::Bot.new
    (0..4).each do |position|
      expect(bot.valid_position?(position)).to eq(true)
    end
  end

  it 'rejects invalid positions' do
    bot = Lemmibot::Bot.new
    [5, 42, -10, -255].each do |position|
      expect(bot.valid_position?(position)).to eq(false)
    end
  end

  it 'will turn left' do
    bot = Lemmibot::Bot.new
    bot.turn(:left)
    expect(bot.direction).to eq(:west)
  end

  it 'will turn right' do
    bot = Lemmibot::Bot.new
    bot.turn(:right)
    expect(bot.direction).to eq(:east)
  end

  it 'will rotate 360 degrees clockwise' do
    bot = Lemmibot::Bot.new
    expect(bot.direction).to eq(:north)
    bot.turn(:right)
    expect(bot.direction).to eq(:east)
    bot.turn(:right)
    expect(bot.direction).to eq(:south)
    bot.turn(:right)
    expect(bot.direction).to eq(:west)
    bot.turn(:right)
    expect(bot.direction).to eq(:north)
  end

  it 'will move to the north east corner, then 2 units west' do
    bot = Lemmibot::Bot.new
    bot.set_direction(:north)
    4.times do
      bot.move
    end
    bot.set_direction(:east)
    4.times do
      bot.move
    end
    expect(bot.pos_x).to eq(4)
    expect(bot.pos_y).to eq(4)
    bot.set_direction(:west)
    2.times do
      bot.move
    end
    expect(bot.pos_x).to eq(2)
    expect(bot.pos_y).to eq(4)
  end

  it 'will not fall off in any direction' do
    bot = Lemmibot::Bot.new
    %i[north south east west].each do |direction|
      bot.set_direction(direction)
      100.times do
        bot.move
      end
      expect(bot.pos_x).to be > -1
      expect(bot.pos_y).to be > -1
      expect(bot.pos_x).to be < 5
      expect(bot.pos_y).to be < 5
    end
  end
end
