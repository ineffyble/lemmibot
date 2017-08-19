require 'spec_helper'

RSpec.describe Lemmibot do
  it 'has a version number' do
    expect(Lemmibot::VERSION).not_to be nil
  end

  it 'can instantiate a bot' do
    bot = Lemmibot::Bot.new
    expect(bot).to be_a(Lemmibot::Bot)
  end

  it 'has a command line interface' do
    cli = Lemmibot::CommandInterface.new
    expect(cli).to be_a(Lemmibot::CommandInterface)
  end
end
