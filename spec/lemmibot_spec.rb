require "spec_helper"

RSpec.describe Lemmibot do
  it "has a version number" do
    expect(Lemmibot::VERSION).not_to be nil
  end

  it "can instantiate a bot" do
    bot = Lemmibot::Bot.new
    expect(bot).to be_a(Lemmibot::Bot)
  end
end
