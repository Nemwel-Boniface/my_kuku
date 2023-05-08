require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
  setup do
    @blog = blogs(:one)
  end

  test "visiting the index" do
    visit blogs_url
    assert_selector "h1", text: "Blogs"
  end

  test "should create blog" do
    visit blogs_url
    click_on "New blog"

    fill_in "Blog image", with: @blog.blog_image
    fill_in "Blog text", with: @blog.blog_text
    fill_in "Blog title", with: @blog.blog_title
    fill_in "Comments counter", with: @blog.comments_counter
    fill_in "Date created", with: @blog.date_created
    click_on "Create Blog"

    assert_text "Blog was successfully created"
    click_on "Back"
  end

  test "should update Blog" do
    visit blog_url(@blog)
    click_on "Edit this blog", match: :first

    fill_in "Blog image", with: @blog.blog_image
    fill_in "Blog text", with: @blog.blog_text
    fill_in "Blog title", with: @blog.blog_title
    fill_in "Comments counter", with: @blog.comments_counter
    fill_in "Date created", with: @blog.date_created
    click_on "Update Blog"

    assert_text "Blog was successfully updated"
    click_on "Back"
  end

  test "should destroy Blog" do
    visit blog_url(@blog)
    click_on "Destroy this blog", match: :first

    assert_text "Blog was successfully destroyed"
  end
end
