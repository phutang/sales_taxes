# Copyright (c) 2014 Phu Tang
# All rights are reserved.

require 'spec_helper'

describe 'Receipt' do

  it 'Create new receipt without item and return receipt object' do
    receipt = Receipt.new
    receipt.should be_an_instance_of Receipt
  end

  context 'With input 1' do
    before do
      @product_1 = Product.new(1, 'book', 12.49, 0, 0)
      @product_2 = Product.new(1, 'music cd', 14.99, 0, 10)
      @product_3 = Product.new(1, 'chocolate bar', 0.85, 0, 0)
    end

    it 'Add some products to receipt and return correct receipt' do
      receipt = Receipt.new
      receipt.add_product(@product_1, 1)
      receipt.add_product(@product_2, 1)
      receipt.add_product(@product_3, 1)
      receipt.should be_an_instance_of Receipt
      receipt.receipt_items.count.should eql(3)
      receipt.print.should eql(%q{1, book, 12.49
1, music cd, 16.49
1, chocolate bar, 0.85

Sales Taxes: 1.50
Total: 29.83
})
    end
  end

  context 'With input 2' do
    before do
      @product_1 = Product.new(1, 'imported box of chocolates', 10.00, 5, 0)
      @product_2 = Product.new(1, 'imported bottle of perfume', 47.50, 5, 10)
    end

    it 'Add some product to receipt and return correct receipt' do
      receipt = Receipt.new
      receipt.add_product(@product_1, 1)
      receipt.add_product(@product_2, 1)
      receipt.should be_an_instance_of Receipt
      receipt.receipt_items.count.should eql(2)
      receipt.print.should eql(%q{1, imported box of chocolates, 10.50
1, imported bottle of perfume, 54.65

Sales Taxes: 7.65
Total: 65.15
})
    end
  end

  context 'With input 3' do
    before do
      @product_1 = Product.new(1, 'imported bottle of perfume', 27.99, 5, 10)
      @product_2 = Product.new(1, 'bottle of perfume', 18.99, 0, 10)
      @product_3 = Product.new(1, 'packet of headache pills', 9.75, 0, 0)
      @product_4 = Product.new(1, 'imported box of chocolates', 11.25, 5, 0)
    end

    it 'Add some product to receipt and return correct receipt' do
      receipt = Receipt.new
      receipt.add_product(@product_1, 1)
      receipt.add_product(@product_2, 1)
      receipt.add_product(@product_3, 1)
      receipt.add_product(@product_4, 1)
      receipt.should be_an_instance_of Receipt
      receipt.receipt_items.count.should eql(4)
      receipt.print.should eql(%q{1, imported bottle of perfume, 32.19
1, bottle of perfume, 20.89
1, packet of headache pills, 9.75
1, imported box of chocolates, 11.85

Sales Taxes: 6.70
Total: 74.68
})
    end
  end

end
