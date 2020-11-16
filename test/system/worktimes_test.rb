require "application_system_test_case"

class WorktimesTest < ApplicationSystemTestCase
  setup do
    @worktime = worktimes(:one)
  end

  test "visiting the index" do
    visit worktimes_url
    assert_selector "h1", text: "Worktimes"
  end

  test "creating a Worktime" do
    visit worktimes_url
    click_on "New Worktime"

    fill_in "Offtime", with: @worktime.offtime
    fill_in "Ontime", with: @worktime.ontime
    click_on "Create Worktime"

    assert_text "Worktime was successfully created"
    click_on "Back"
  end

  test "updating a Worktime" do
    visit worktimes_url
    click_on "Edit", match: :first

    fill_in "Offtime", with: @worktime.offtime
    fill_in "Ontime", with: @worktime.ontime
    click_on "Update Worktime"

    assert_text "Worktime was successfully updated"
    click_on "Back"
  end

  test "destroying a Worktime" do
    visit worktimes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Worktime was successfully destroyed"
  end
end
