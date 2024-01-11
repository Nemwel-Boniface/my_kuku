require "test_helper"

class ChickensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chicken = chickens(:one)
  end

  test "should get index" do
    get chickens_url
    assert_response :success
  end

  test "should get new" do
    get new_chicken_url
    assert_response :success
  end

  test "should create chicken" do
    assert_difference("Chicken.count") do
      post chickens_url, params: { chicken: { age: @chicken.age, chicken_images: @chicken.chicken_images, date_hatched: @chicken.date_hatched, parent_id: @chicken.parent_id, tag_number: @chicken.tag_number } }
    end

    assert_redirected_to chicken_url(Chicken.last)
  end

  test "should show chicken" do
    get chicken_url(@chicken)
    assert_response :success
  end

  test "should get edit" do
    get edit_chicken_url(@chicken)
    assert_response :success
  end

  test "should update chicken" do
    patch chicken_url(@chicken), params: { chicken: { age: @chicken.age, chicken_images: @chicken.chicken_images, date_hatched: @chicken.date_hatched, parent_id: @chicken.parent_id, tag_number: @chicken.tag_number } }
    assert_redirected_to chicken_url(@chicken)
  end

  test "should destroy chicken" do
    assert_difference("Chicken.count", -1) do
      delete chicken_url(@chicken)
    end

    assert_redirected_to chickens_url
  end
end
