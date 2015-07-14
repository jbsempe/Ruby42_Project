require 'test_helper'

class Admin::SessionsControllerTest < ActionController::TestCase
  setup do
    @admin_user = users(:one)
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    post :create, { email: 'jb@jb.com', password: 'secret' }
    assert @controller.current_user.present?
    assert_redirected_to admin_root_path
  end
end
