require 'test_helper'

class NationalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @national = nationals(:one)
  end

  test "should get index" do
    get nationals_url
    assert_response :success
  end

  test "should get new" do
    get new_national_url
    assert_response :success
  end

  test "should create national" do
    assert_difference('National.count') do
      post nationals_url, params: { national: { name: @national.name } }
    end

    assert_redirected_to national_url(National.last)
  end

  test "should show national" do
    get national_url(@national)
    assert_response :success
  end

  test "should get edit" do
    get edit_national_url(@national)
    assert_response :success
  end

  test "should update national" do
    patch national_url(@national), params: { national: { name: @national.name } }
    assert_redirected_to national_url(@national)
  end

  test "should destroy national" do
    assert_difference('National.count', -1) do
      delete national_url(@national)
    end

    assert_redirected_to nationals_url
  end
end
