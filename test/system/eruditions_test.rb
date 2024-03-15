require "application_system_test_case"

class EruditionsTest < ApplicationSystemTestCase
  setup do
    @erudition = eruditions(:one)
  end

  test "visiting the index" do
    visit eruditions_url
    assert_selector "h1", text: "Eruditions"
  end

  test "should create erudition" do
    visit eruditions_url
    click_on "New erudition"

    fill_in "Description", with: @erudition.description
    fill_in "Title", with: @erudition.title
    click_on "Create Erudition"

    assert_text "Erudition was successfully created"
    click_on "Back"
  end

  test "should update Erudition" do
    visit erudition_url(@erudition)
    click_on "Edit this erudition", match: :first

    fill_in "Description", with: @erudition.description
    fill_in "Title", with: @erudition.title
    click_on "Update Erudition"

    assert_text "Erudition was successfully updated"
    click_on "Back"
  end

  test "should destroy Erudition" do
    visit erudition_url(@erudition)
    click_on "Destroy this erudition", match: :first

    assert_text "Erudition was successfully destroyed"
  end
end
