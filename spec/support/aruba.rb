require 'aruba/api'

Aruba.configure do |config|
  config.exit_timeout = 1
end

RSpec.configure do |config|
  config.include(Aruba::Api)

  config.before do
    setup_aruba
  end
end
