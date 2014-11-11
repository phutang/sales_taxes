# Copyright (c) 2014 Phu Tang
# All rights are reserved.

module PriceHelper
  def tax_round(number)
    parts = (number * 10).to_s.split('.')
    left_part = parts[0].to_f
    right_part = parts.count > 1 ? parts[1].to_i : 0
    if right_part > 0
      fraction = "0.#{right_part}".to_f
      if fraction < 0.5
        left_part += 0.5
      else
        left_part += 1
      end
    end

    left_part / 10
  end

  def add_zero(number)
    '%.2f' % number
  end
end
