# Copyright (c) 2014 Phu Tang
# All rights are reserved.

require 'uuid'
require_relative '../helpers/price_helper'

class ReceiptItem
  include PriceHelper
  attr_accessor :id
  attr_accessor :receipt
  attr_accessor :product
  attr_accessor :quantity
  attr_accessor :name
  attr_accessor :unit_price
  attr_accessor :imported_rate
  attr_accessor :vat_rate

  def initialize(receipt, product, quantity)
    @id = UUID.new.generate
    @receipt = receipt
    @product = product
    @quantity = quantity
    @name = product.name
    @unit_price = product.price
    @imported_rate = product.imported_rate
    @vat_rate = product.vat_rate
  end

  def sale_taxes
    final_price = @unit_price * @quantity
    total_rate = @imported_rate + @vat_rate
    sale_taxes = 0.0

    if total_rate > 0
      sale_taxes = final_price * total_rate / 100
    end

    tax_round(sale_taxes)
  end

  def final_price
    final_price = @unit_price * @quantity

    final_price + sale_taxes
  end
end