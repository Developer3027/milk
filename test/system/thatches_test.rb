require "application_system_test_case"

class ThatchesTest < ApplicationSystemTestCase
  setup do
    @thatch = thatches(:one)
  end

  test "visiting the index" do
    visit thatches_url
    assert_selector "h1", text: "Thatches"
  end

  test "should create thatch" do
    visit thatches_url
    click_on "New thatch"

    fill_in "Artist", with: @thatch.artist
    fill_in "Song title", with: @thatch.song_title
    fill_in "Year", with: @thatch.year
    click_on "Create Thatch"

    assert_text "Thatch was successfully created"
    click_on "Back"
  end

  test "should update Thatch" do
    visit thatch_url(@thatch)
    click_on "Edit this thatch", match: :first

    fill_in "Artist", with: @thatch.artist
    fill_in "Song title", with: @thatch.song_title
    fill_in "Year", with: @thatch.year
    click_on "Update Thatch"

    assert_text "Thatch was successfully updated"
    click_on "Back"
  end

  test "should destroy Thatch" do
    visit thatch_url(@thatch)
    click_on "Destroy this thatch", match: :first

    assert_text "Thatch was successfully destroyed"
  end
end
