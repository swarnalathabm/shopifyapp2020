require "application_system_test_case"

class TagcreationsTest < ApplicationSystemTestCase
  setup do
    @tagcreation = tagcreations(:one)
  end

  test "visiting the index" do
    visit tagcreations_url
    assert_selector "h1", text: "Tagcreations"
  end

  test "creating a Tagcreation" do
    visit tagcreations_url
    click_on "New Tagcreation"

    fill_in "Productoption", with: @tagcreation.productoption
    fill_in "Producttag", with: @tagcreation.producttag
    fill_in "Producttagid", with: @tagcreation.producttagid
    fill_in "Producttitle", with: @tagcreation.producttitle
    fill_in "Productvalue", with: @tagcreation.productvalue
    click_on "Create Tagcreation"

    assert_text "Tagcreation was successfully created"
    click_on "Back"
  end

  test "updating a Tagcreation" do
    visit tagcreations_url
    click_on "Edit", match: :first

    fill_in "Productoption", with: @tagcreation.productoption
    fill_in "Producttag", with: @tagcreation.producttag
    fill_in "Producttagid", with: @tagcreation.producttagid
    fill_in "Producttitle", with: @tagcreation.producttitle
    fill_in "Productvalue", with: @tagcreation.productvalue
    click_on "Update Tagcreation"

    assert_text "Tagcreation was successfully updated"
    click_on "Back"
  end

  test "destroying a Tagcreation" do
    visit tagcreations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tagcreation was successfully destroyed"
  end
end
