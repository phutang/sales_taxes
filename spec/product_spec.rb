# Copyright (c) 2014 Phu Tang
# All rights are reserved.

require 'spec_helper'

describe 'Product' do

  it 'Add internal product and return product object' do
    in_product = Product.new(1, 'book', 12.49, 0, 0)
    in_product.should be_an_instance_of Product
  end

  it 'Add imported product and return product object' do
    im_product = Product.new(1, 'imported box of chocolates', 10.00, 5, 0)
    im_product.should be_an_instance_of Product
  end

end