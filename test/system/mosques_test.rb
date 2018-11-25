require "application_system_test_case"

class MosquesTest < ApplicationSystemTestCase
  setup do
    @mosque = mosques(:one)
  end

  test "visiting the index" do
    visit mosques_url
    assert_selector "h1", text: "Mosques"
  end

  test "creating a Mosque" do
    visit mosques_url
    click_on "New Mosque"

    fill_in "Address", with: @mosque.address
    fill_in "Latitude", with: @mosque.latitude
    fill_in "Longitude", with: @mosque.longitude
    fill_in "Name", with: @mosque.name
    fill_in "User", with: @mosque.user_id
    click_on "Create Mosque"

    assert_text "Mosque was successfully created"
    click_on "Back"
  end

  test "updating a Mosque" do
    visit mosques_url
    click_on "Edit", match: :first

    fill_in "Address", with: @mosque.address
    fill_in "Latitude", with: @mosque.latitude
    fill_in "Longitude", with: @mosque.longitude
    fill_in "Name", with: @mosque.name
    fill_in "User", with: @mosque.user_id
    click_on "Update Mosque"

    assert_text "Mosque was successfully updated"
    click_on "Back"
  end

  test "destroying a Mosque" do
    visit mosques_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mosque was successfully destroyed"
  end
end
