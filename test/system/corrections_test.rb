require "application_system_test_case"

class CorrectionsTest < ApplicationSystemTestCase
  setup do
    @correction = corrections(:one)
  end

  test "visiting the index" do
    visit corrections_url
    assert_selector "h1", text: "Corrections"
  end

  test "creating a Correction" do
    visit corrections_url
    click_on "New Correction"

    fill_in "Body", with: @correction.body
    check "Is accepted" if @correction.is_accepted
    click_on "Create Correction"

    assert_text "Correction was successfully created"
    click_on "Back"
  end

  test "updating a Correction" do
    visit corrections_url
    click_on "Edit", match: :first

    fill_in "Body", with: @correction.body
    check "Is accepted" if @correction.is_accepted
    click_on "Update Correction"

    assert_text "Correction was successfully updated"
    click_on "Back"
  end

  test "destroying a Correction" do
    visit corrections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Correction was successfully destroyed"
  end
end
