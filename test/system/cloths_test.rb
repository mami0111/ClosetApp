require "application_system_test_case"

class ClothsTest < ApplicationSystemTestCase
  setup do
    @cloth = cloths(:one)
  end

  test "visiting the index" do
    visit cloths_url
    assert_selector "h1", text: "Cloths"
  end

  test "creating a Cloth" do
    visit cloths_url
    click_on "New Cloth"

    fill_in "Category", with: @cloth.category
    fill_in "Color", with: @cloth.color
    fill_in "Image Cloth", with: @cloth.image_cloth
    fill_in "Memo", with: @cloth.memo
    fill_in "Name", with: @cloth.name
    fill_in "User", with: @cloth.user
    click_on "登録"

    assert_text "Cloth was successfully created"
    click_on "Back"
  end

  test "updating a Cloth" do
    visit cloths_url
    click_on "Edit", match: :first

    fill_in "Category", with: @cloth.category
    fill_in "Color", with: @cloth.color
    fill_in "Image Cloth", with: @cloth.image_cloth
    fill_in "Memo", with: @cloth.memo
    fill_in "Name", with: @cloth.name
    fill_in "User", with: @cloth.user
    click_on "更新"

    assert_text "Cloth was successfully updated"
    click_on "Back"
  end

  test "destroying a Cloth" do
    visit cloths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cloth was successfully destroyed"
  end
end
