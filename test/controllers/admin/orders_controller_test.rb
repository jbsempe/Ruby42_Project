require 'test_helper'

class Admin::OrdersControllerTest < ActionController::TestCase

  setup do
    @order = orders(:one)
    @user = users(:one)
    sign_in (@user)
  end

  test "index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "edit" do
    get :edit, id: @order.id
    assert_response :success
  end

  test "update" do
    put :update, id: @order.id, order:
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
    assert_redirected_to admin_orders_path
  end

  test "update with invalid inforamtions" do
    put :update, id: @order.id, order:
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

  test "destroy" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order.id
    end
    assert_redirected_to admin_orders_path
  end
end