$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require File.expand_path(__FILE__ + './../../lib/authentication')

RSpec.configure do |config|
  config.order = "random"
end
