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
    bot.face(:east)
    expect(bot.direction).to eq(:east)
  end

  it 'will not face southwest' do
    bot = Lemmibot::Bot.new
    bot.face(:south)
    bot.face(:southwest)
    expect(bot.direction).to eq(:south)
  end
end
