require 'test_helper'

class ProductlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productlist = productlists(:one)
  end

  test "should get index" do
    get productlists_url
    assert_response :success
  end

  test "should get new" do
    get new_productlist_url
    assert_response :success
  end

  test "should create productlist" do
    assert_difference('Productlist.count') do
      post productlists_url, params: { productlist: { body: @productlist.body, option1: @productlist.option1, option1val: @productlist.option1val, option2: @productlist.option2, option2val: @productlist.option2val, option3: @productlist.option3, option3val: @productlist.option3val, title: @productlist.title } }
    end

    assert_redirected_to productlist_url(Productlist.last)
  end

  test "should show productlist" do
    get productlist_url(@productlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_productlist_url(@productlist)
    assert_response :success
  end

  test "should update productlist" do
    patch productlist_url(@productlist), params: { productlist: { body: @productlist.body, option1: @productlist.option1, option1val: @productlist.option1val, option2: @productlist.option2, option2val: @productlist.option2val, option3: @productlist.option3, option3val: @productlist.option3val, title: @productlist.title } }
    assert_redirected_to productlist_url(@productlist)
  end

  test "should destroy productlist" do
    assert_difference('Productlist.count', -1) do
      delete productlist_url(@productlist)
    end

    assert_redirected_to productlists_url
  end
end
