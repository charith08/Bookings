require "application_system_test_case"

class PusersTest < ApplicationSystemTestCase
  setup do
    @puser = pusers(:one)
  end

  test "visiting the index" do
    visit pusers_url
    assert_selector "h1", text: "Pusers"
  end

  test "creating a Puser" do
    visit pusers_url
    click_on "New Puser"

    click_on "Create Puser"

    assert_text "Puser was successfully created"
    click_on "Back"
  end

  test "updating a Puser" do
    visit pusers_url
    click_on "Edit", match: :first

    click_on "Update Puser"

    assert_text "Puser was successfully updated"
    click_on "Back"
  end

  test "destroying a Puser" do
    visit pusers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Puser was successfully destroyed"
  end
end
