require 'test_helper'

class WorktimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worktime = worktimes(:one)
  end

  test "should get index" do
    get worktimes_url
    assert_response :success
  end

  test "should get new" do
    get new_worktime_url
    assert_response :success
  end

  test "should create worktime" do
    assert_difference('Worktime.count') do
      post worktimes_url, params: { worktime: { offtime: @worktime.offtime, ontime: @worktime.ontime } }
    end

    assert_redirected_to worktime_url(Worktime.last)
  end

  test "should show worktime" do
    get worktime_url(@worktime)
    assert_response :success
  end

  test "should get edit" do
    get edit_worktime_url(@worktime)
    assert_response :success
  end

  test "should update worktime" do
    patch worktime_url(@worktime), params: { worktime: { offtime: @worktime.offtime, ontime: @worktime.ontime } }
    assert_redirected_to worktime_url(@worktime)
  end

  test "should destroy worktime" do
    assert_difference('Worktime.count', -1) do
      delete worktime_url(@worktime)
    end

    assert_redirected_to worktimes_url
  end
end
