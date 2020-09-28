require 'test_helper'

class CustomerreviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customerreview = customerreviews(:one)
  end

  test "should get index" do
    get customerreviews_url
    assert_response :success
  end

  test "should get new" do
    get new_customerreview_url
    assert_response :success
  end

  test "should create customerreview" do
    assert_difference('Customerreview.count') do
      post customerreviews_url, params: { customerreview: { customeremail: @customerreview.customeremail, customername: @customerreview.customername, customertype: @customerreview.customertype, productid: @customerreview.productid, publish: @customerreview.publish, reviewbody: @customerreview.reviewbody, reviewid: @customerreview.reviewid, reviewrating: @customerreview.reviewrating } }
    end

    assert_redirected_to customerreview_url(Customerreview.last)
  end

  test "should show customerreview" do
    get customerreview_url(@customerreview)
    assert_response :success
  end

  test "should get edit" do
    get edit_customerreview_url(@customerreview)
    assert_response :success
  end

  test "should update customerreview" do
    patch customerreview_url(@customerreview), params: { customerreview: { customeremail: @customerreview.customeremail, customername: @customerreview.customername, customertype: @customerreview.customertype, productid: @customerreview.productid, publish: @customerreview.publish, reviewbody: @customerreview.reviewbody, reviewid: @customerreview.reviewid, reviewrating: @customerreview.reviewrating } }
    assert_redirected_to customerreview_url(@customerreview)
  end

  test "should destroy customerreview" do
    assert_difference('Customerreview.count', -1) do
      delete customerreview_url(@customerreview)
    end

    assert_redirected_to customerreviews_url
  end
end
