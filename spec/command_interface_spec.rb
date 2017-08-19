require 'spec_helper'

RSpec.describe Lemmibot::CommandInterface do
  it 'shows a ready message' do
    run './exe/lemmibot'

    stop_all_commands
    expect(last_command_started.output.chomp).to eq('Lemmibot is awaiting your commands')
  end

  it 'executes acceptance example A' do
    run './exe/lemmibot'
    type 'PLACE 0,0,NORTH'
    type 'MOVE'
    type 'REPORT'

    stop_all_commands
    expect(last_command_started.output.split("\n").last).to eq('0,1,NORTH')
  end

  it 'executes acceptance example B' do
    run './exe/lemmibot'
    type 'PLACE 0,0,NORTH'
    type 'LEFT'
    type 'REPORT'

    stop_all_commands
    expect(last_command_started.output.split("\n").last).to eq('0,0,WEST')
  end

  it 'executes acceptance example C' do
    run './exe/lemmibot'
    type 'PLACE 1,2,EAST'
    type 'MOVE'
    type 'MOVE'
    type 'LEFT'
    type 'MOVE'
    type 'REPORT'

    stop_all_commands
    expect(last_command_started.output.split("\n").last).to eq('3,3,NORTH')
  end

  it 'will not report before being placed' do
    run './exe/lemmibot'
    type 'REPORT'

    stop_all_commands
    expect(last_command_started.output.chomp).to eq('Lemmibot is awaiting your commands')
  end
end
