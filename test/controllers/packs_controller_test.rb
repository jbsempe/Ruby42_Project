require 'test_helper'

class Admin::PacksControllerTest < ActionController::TestCase

  setup do
    @pack = packs(:one)
  end

  test "should get public" do
    get :index
    assert_response :success
  end


end
