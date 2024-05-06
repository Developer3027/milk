require "test_helper"

class ThatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thatch = thatches(:one)
  end

  test "should get index" do
    get thatches_url
    assert_response :success
  end

  test "should get new" do
    get new_thatch_url
    assert_response :success
  end

  test "should create thatch" do
    assert_difference("Thatch.count") do
      post thatches_url, params: { thatch: { artist: @thatch.artist, song_title: @thatch.song_title, year: @thatch.year } }
    end

    assert_redirected_to thatch_url(Thatch.last)
  end

  test "should show thatch" do
    get thatch_url(@thatch)
    assert_response :success
  end

  test "should get edit" do
    get edit_thatch_url(@thatch)
    assert_response :success
  end

  test "should update thatch" do
    patch thatch_url(@thatch), params: { thatch: { artist: @thatch.artist, song_title: @thatch.song_title, year: @thatch.year } }
    assert_redirected_to thatch_url(@thatch)
  end

  test "should destroy thatch" do
    assert_difference("Thatch.count", -1) do
      delete thatch_url(@thatch)
    end

    assert_redirected_to thatches_url
  end
end
