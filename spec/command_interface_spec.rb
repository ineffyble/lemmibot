require 'spec_helper'

RSpec.describe Lemmibot::CommandInterface do
    it 'shows a ready message' do
        run './exe/lemmibot'

        stop_all_commands
        expect(last_command_started.output).to eq("Lemmibot is awaiting your commands\n")
    end
end