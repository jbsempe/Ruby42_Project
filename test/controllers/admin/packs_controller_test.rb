require 'test_helper'

class Admin::PacksControllerTest < ActionController::TestCase

  setup do
    @pack = packs(:one)
    @user = users(:one)
    sign_in (@user)
  end

  test "index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packs)
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    assert_difference('Pack.count') do
      post :create, pack:
      {
        description_en: @pack.description, format: @pack.format,
        quantity: @pack.quantity, title_en: @pack.title,
        ingraving: @pack.ingraving, vinyl_colors: @pack.vinyl_colors,
        label: @pack.label, external_sleeve: @pack.external_sleeve,
        sleeve: @pack.sleeve, packaging: @pack.packaging,
        weight: @pack.weight
      }
    end
    assert_redirected_to admin_packs_path
  end

  test "create with invalid informations" do
    post :create, pack:
    {
      description_en: nil, format: @pack.format,
      quantity: @pack.quantity, title_en: @pack.title,
      ingraving: @pack.ingraving, vinyl_colors: @pack.vinyl_colors,
      label: @pack.label, external_sleeve: @pack.external_sleeve,
      sleeve: @pack.sleeve, packaging: @pack.packaging,
      weight: @pack.weight
    }
    assert_response :unprocessable_entity
  end

  test "edit" do
    get :edit, id: @pack.id
    assert_response :success
  end

  test "update" do
    put :update, id: @pack.id, pack: { description_en: @pack.description, format: @pack.format, quantity: @pack.quantity, title_en: @pack.quantity, ingraving: @pack.ingraving, vinyl_colors: @pack.vinyl_colors, label: @pack.label, external_sleeve: @pack.external_sleeve, sleeve: @pack.sleeve, packaging: @pack.packaging, weight: @pack.weight }
    assert_redirected_to admin_packs_path
  end

  test "update with invalid informations" do
    put :update, id: @pack.id, pack: { description_en: nil, format: @pack.format, quantity: @pack.quantity, title_en: @pack.quantity, ingraving: @pack.ingraving, vinyl_colors: @pack.vinyl_colors, label: @pack.label, external_sleeve: @pack.external_sleeve, sleeve: @pack.sleeve, packaging: @pack.packaging, weight: @pack.weight }
    assert_response :unprocessable_entity
  end

  test "destroy" do
    assert_difference('Pack.count', -1) do
      delete :destroy, id: @pack.id
    end
    assert_redirected_to admin_packs_path
  end


end
