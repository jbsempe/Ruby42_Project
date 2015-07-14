require 'test_helper'

class PriceCalculationTest < ActiveSupport::TestCase

  test "price" do
    order = orders(:one)
    assert_equal 424, PriceCalculation.new(order).price
  end
end
