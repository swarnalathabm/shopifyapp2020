require "application_system_test_case"

class CustomerreviewsTest < ApplicationSystemTestCase
  setup do
    @customerreview = customerreviews(:one)
  end

  test "visiting the index" do
    visit customerreviews_url
    assert_selector "h1", text: "Customerreviews"
  end

  test "creating a Customerreview" do
    visit customerreviews_url
    click_on "New Customerreview"

    fill_in "Customeremail", with: @customerreview.customeremail
    fill_in "Customername", with: @customerreview.customername
    fill_in "Customertype", with: @customerreview.customertype
    fill_in "Productid", with: @customerreview.productid
    fill_in "Publish", with: @customerreview.publish
    fill_in "Reviewbody", with: @customerreview.reviewbody
    fill_in "Reviewid", with: @customerreview.reviewid
    fill_in "Reviewrating", with: @customerreview.reviewrating
    click_on "Create Customerreview"

    assert_text "Customerreview was successfully created"
    click_on "Back"
  end

  test "updating a Customerreview" do
    visit customerreviews_url
    click_on "Edit", match: :first

    fill_in "Customeremail", with: @customerreview.customeremail
    fill_in "Customername", with: @customerreview.customername
    fill_in "Customertype", with: @customerreview.customertype
    fill_in "Productid", with: @customerreview.productid
    fill_in "Publish", with: @customerreview.publish
    fill_in "Reviewbody", with: @customerreview.reviewbody
    fill_in "Reviewid", with: @customerreview.reviewid
    fill_in "Reviewrating", with: @customerreview.reviewrating
    click_on "Update Customerreview"

    assert_text "Customerreview was successfully updated"
    click_on "Back"
  end

  test "destroying a Customerreview" do
    visit customerreviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customerreview was successfully destroyed"
  end
end
