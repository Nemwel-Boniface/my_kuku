require "application_system_test_case"

class ChickensTest < ApplicationSystemTestCase
  setup do
    @chicken = chickens(:one)
  end

  test "visiting the index" do
    visit chickens_url
    assert_selector "h1", text: "Chickens"
  end

  test "should create chicken" do
    visit chickens_url
    click_on "New chicken"

    fill_in "Age", with: @chicken.age
    fill_in "Chicken images", with: @chicken.chicken_images
    fill_in "Date hatched", with: @chicken.date_hatched
    fill_in "Parent", with: @chicken.parent_id
    fill_in "Tag number", with: @chicken.tag_number
    click_on "Create Chicken"

    assert_text "Chicken was successfully created"
    click_on "Back"
  end

  test "should update Chicken" do
    visit chicken_url(@chicken)
    click_on "Edit this chicken", match: :first

    fill_in "Age", with: @chicken.age
    fill_in "Chicken images", with: @chicken.chicken_images
    fill_in "Date hatched", with: @chicken.date_hatched
    fill_in "Parent", with: @chicken.parent_id
    fill_in "Tag number", with: @chicken.tag_number
    click_on "Update Chicken"

    assert_text "Chicken was successfully updated"
    click_on "Back"
  end

  test "should destroy Chicken" do
    visit chicken_url(@chicken)
    click_on "Destroy this chicken", match: :first

    assert_text "Chicken was successfully destroyed"
  end
end
