require 'test_helper'

class ScrapsControllerTest < ActionController::TestCase
  setup do
    @scrap = scraps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scraps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrap" do
    assert_difference('Scrap.count') do
      post :create, scrap: { desc: @scrap.desc, image: @scrap.image, price: @scrap.price, title: @scrap.title, url: @scrap.url }
    end

    assert_redirected_to scrap_path(assigns(:scrap))
  end

  test "should show scrap" do
    get :show, id: @scrap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrap
    assert_response :success
  end

  test "should update scrap" do
    patch :update, id: @scrap, scrap: { desc: @scrap.desc, image: @scrap.image, price: @scrap.price, title: @scrap.title, url: @scrap.url }
    assert_redirected_to scrap_path(assigns(:scrap))
  end

  test "should destroy scrap" do
    assert_difference('Scrap.count', -1) do
      delete :destroy, id: @scrap
    end

    assert_redirected_to scraps_path
  end
end
