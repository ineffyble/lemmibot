require 'spec_helper'

RSpec.describe Lemmibot::Bot do
  it 'starts at 0,0,NORTH' do
    bot = Lemmibot::Bot.new
    expect(bot.pos_x).to eq(0)
    expect(bot.pos_y).to eq(0)
    expect(bot.direction).to eq(:north)
  end
end
