require "application_system_test_case"

class ProductlistsTest < ApplicationSystemTestCase
  setup do
    @productlist = productlists(:one)
  end

  test "visiting the index" do
    visit productlists_url
    assert_selector "h1", text: "Productlists"
  end

  test "creating a Productlist" do
    visit productlists_url
    click_on "New Productlist"

    fill_in "Body", with: @productlist.body
    fill_in "Option1", with: @productlist.option1
    fill_in "Option1val", with: @productlist.option1val
    fill_in "Option2", with: @productlist.option2
    fill_in "Option2val", with: @productlist.option2val
    fill_in "Option3", with: @productlist.option3
    fill_in "Option3val", with: @productlist.option3val
    fill_in "Title", with: @productlist.title
    click_on "Create Productlist"

    assert_text "Productlist was successfully created"
    click_on "Back"
  end

  test "updating a Productlist" do
    visit productlists_url
    click_on "Edit", match: :first

    fill_in "Body", with: @productlist.body
    fill_in "Option1", with: @productlist.option1
    fill_in "Option1val", with: @productlist.option1val
    fill_in "Option2", with: @productlist.option2
    fill_in "Option2val", with: @productlist.option2val
    fill_in "Option3", with: @productlist.option3
    fill_in "Option3val", with: @productlist.option3val
    fill_in "Title", with: @productlist.title
    click_on "Update Productlist"

    assert_text "Productlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Productlist" do
    visit productlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Productlist was successfully destroyed"
  end
end
