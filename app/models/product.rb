# Copyright (c) 2014 Phu Tang
# All rights are reserved.

require 'uuid'

class Product
  attr_accessor :id
  attr_accessor :quantity
  attr_accessor :name
  attr_accessor :price
  attr_accessor :imported_rate
  attr_accessor :vat_rate

  def initialize(quantity, name, price, imported_rate, vat_rate)
    @id = UUID.new.generate
    @quantity = quantity
    @name = name
    @price = price
    @imported_rate = imported_rate
    @vat_rate = vat_rate
  end
end