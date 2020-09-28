require 'test_helper'

class TagcreationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tagcreation = tagcreations(:one)
  end

  test "should get index" do
    get tagcreations_url
    assert_response :success
  end

  test "should get new" do
    get new_tagcreation_url
    assert_response :success
  end

  test "should create tagcreation" do
    assert_difference('Tagcreation.count') do
      post tagcreations_url, params: { tagcreation: { productoption: @tagcreation.productoption, producttag: @tagcreation.producttag, producttagid: @tagcreation.producttagid, producttitle: @tagcreation.producttitle, productvalue: @tagcreation.productvalue } }
    end

    assert_redirected_to tagcreation_url(Tagcreation.last)
  end

  test "should show tagcreation" do
    get tagcreation_url(@tagcreation)
    assert_response :success
  end

  test "should get edit" do
    get edit_tagcreation_url(@tagcreation)
    assert_response :success
  end

  test "should update tagcreation" do
    patch tagcreation_url(@tagcreation), params: { tagcreation: { productoption: @tagcreation.productoption, producttag: @tagcreation.producttag, producttagid: @tagcreation.producttagid, producttitle: @tagcreation.producttitle, productvalue: @tagcreation.productvalue } }
    assert_redirected_to tagcreation_url(@tagcreation)
  end

  test "should destroy tagcreation" do
    assert_difference('Tagcreation.count', -1) do
      delete tagcreation_url(@tagcreation)
    end

    assert_redirected_to tagcreations_url
  end
end
