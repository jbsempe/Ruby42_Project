require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "new from pack" do
    pack = packs(:one)
    order = Order.new_from_pack(pack)
    assert_equal pack, order.pack
    assert_equal pack.format, order.format
    assert_equal pack.quantity, order.quantity
    assert_equal pack.vinyl_colors, order.vinyl_colors
    assert_equal pack.label, order.label
    assert_equal pack.external_sleeve, order.external_sleeve
    assert_equal pack.sleeve, order.sleeve
    assert_equal pack.packaging, order.packaging
    assert_equal pack.weight, order.weight
    assert order.client
    assert order.is_quote
  end
end
