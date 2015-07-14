require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  setup do
    @order = orders(:one)
    @user = users(:one)
    sign_in (@user)
  end

  test "index" do
    get :index
    assert_redirected_to packs_path
  end

  test "new" do
    get :show , id: @order.id, format: :pdf
    assert_response :success
  end

  test "show pdf" do
  end

  test "price" do
    get 'price', :format => :json, quantity: @order.quantity,
        format: @order.format, ingraving: @order.ingraving,
        vinyl_colors: @order.vinyl_colors, label: @order.label,
        external_sleeve: @order.external_sleeve, sleeve: @order.sleeve,
        packaging: @order.packaging, weight: @order.weight
    assert_response :success
  end

  test "create" do
    assert_difference('Order.count') do
      post :create, order:
      {
        artist_name: @order.artist_name, album_title: @order.album_title,
        label_name: @order.label_name, num_cat: @order.num_cat,
        delivery_price: @order.delivery_price, status: @order.status,
        total_price: @order.total_price, quantity: @order.quantity,
        format: @order.format, ingraving: @order.ingraving,
        vinyl_colors: @order.vinyl_colors, label: @order.label,
        external_sleeve: @order.external_sleeve, sleeve: @order.sleeve,
        packaging: @order.packaging, weight: @order.weight,
        pack_id: @order.pack_id, client: @order.client
      }
    end
    assert_redirected_to packs_path
  end

  test "create with invalid informations" do
    post :create, order:
    {
      artist_name: nil, album_title: @order.album_title,
      label_name: @order.label_name, num_cat: @order.num_cat,
      delivery_price: @order.delivery_price, status: @order.status,
      total_price: @order.total_price, quantity: @order.quantity,
      format: @order.format, ingraving: @order.ingraving,
      vinyl_colors: @order.vinyl_colors, label: @order.label,
      external_sleeve: @order.external_sleeve, sleeve: @order.sleeve,
      packaging: @order.packaging, weight: @order.weight,
      pack_id: @order.pack_id, client: @order.client
    }
    assert_response :unprocessable_entity
  end

end