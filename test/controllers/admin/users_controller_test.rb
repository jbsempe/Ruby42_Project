require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @admin_user = users(:one)
    sign_in (@admin_user)
  end

  test "should get edit" do
    get :edit, id: @admin_user
    assert_response :success
  end

  test "should update admin_user" do
    patch :update, id: @admin_user, user: { email: @admin_user.email, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to admin_root_path
  end

  test "should not update admin_user without email" do
    patch :update, id: @admin_user, user: { email: nil, password: 'secret', password_confirmation: 'secret' }
    assert_response :unprocessable_entity
  end
end
