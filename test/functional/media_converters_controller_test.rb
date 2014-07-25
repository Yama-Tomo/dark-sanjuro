require 'test_helper'

class MediaConvertersControllerTest < ActionController::TestCase
  setup do
    @media_converter = media_converters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_converters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_converter" do
    assert_difference('MediaConverter.count') do
      post :create, media_converter: { bandwidth: @media_converter.bandwidth, name: @media_converter.name, trans_lost_from: @media_converter.trans_lost_from, trans_lost_to: @media_converter.trans_lost_to }
    end

    assert_redirected_to media_converter_path(assigns(:media_converter))
  end

  test "should show media_converter" do
    get :show, id: @media_converter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @media_converter
    assert_response :success
  end

  test "should update media_converter" do
    put :update, id: @media_converter, media_converter: { bandwidth: @media_converter.bandwidth, name: @media_converter.name, trans_lost_from: @media_converter.trans_lost_from, trans_lost_to: @media_converter.trans_lost_to }
    assert_redirected_to media_converter_path(assigns(:media_converter))
  end

  test "should destroy media_converter" do
    assert_difference('MediaConverter.count', -1) do
      delete :destroy, id: @media_converter
    end

    assert_redirected_to media_converters_path
  end
end
