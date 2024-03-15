require "test_helper"

class EruditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @erudition = eruditions(:one)
  end

  test "should get index" do
    get eruditions_url
    assert_response :success
  end

  test "should get new" do
    get new_erudition_url
    assert_response :success
  end

  test "should create erudition" do
    assert_difference("Erudition.count") do
      post eruditions_url, params: { erudition: { description: @erudition.description, title: @erudition.title } }
    end

    assert_redirected_to erudition_url(Erudition.last)
  end

  test "should show erudition" do
    get erudition_url(@erudition)
    assert_response :success
  end

  test "should get edit" do
    get edit_erudition_url(@erudition)
    assert_response :success
  end

  test "should update erudition" do
    patch erudition_url(@erudition), params: { erudition: { description: @erudition.description, title: @erudition.title } }
    assert_redirected_to erudition_url(@erudition)
  end

  test "should destroy erudition" do
    assert_difference("Erudition.count", -1) do
      delete erudition_url(@erudition)
    end

    assert_redirected_to eruditions_url
  end
end
