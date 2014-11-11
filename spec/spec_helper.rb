# Copyright (c) 2014 Phu Tang
# All rights are reserved.

require_relative '../app/models/product'
require_relative '../app/models/receipt'
require_relative '../app/models/receipt_item'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end