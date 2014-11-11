# Copyright (c) 2014 Phu Tang
# All rights are reserved.

require 'uuid'
require_relative '../helpers/price_helper'

class Receipt
  include PriceHelper
  attr_accessor :id
  attr_accessor :receipt_items
  attr_accessor :created_date

  def initialize
    @id = UUID.new.generate
    @receipt_items = []
    @total_rate = 0
    @total_price = 0
    @created_date = Time.now
  end

  def add_product(product, quantity = 1)
    if product.quantity < quantity
      raise 'Not more items'
    end

    receipt_item = ReceiptItem.new(self, product, quantity)
    @receipt_items << receipt_item
    product.quantity = product.quantity - quantity
  end

  def sale_taxes
    result = 0.0
    @receipt_items.each do |receipt_item|
      result += receipt_item.sale_taxes
    end
    result
  end

  def total_price
    result = 0.0
    @receipt_items.each do |receipt_item|
      result += receipt_item.final_price
    end
    result
  end

  def print
    result = ''
    @receipt_items.each do |receipt_item|
      result += "#{receipt_item.quantity}, #{receipt_item.name}, #{add_zero(receipt_item.final_price)}\n"
    end

    result += "\n"
    result += "Sales Taxes: #{add_zero(sale_taxes)}\n"
    result += "Total: #{add_zero(total_price)}\n"
    p result

    result
  end
end