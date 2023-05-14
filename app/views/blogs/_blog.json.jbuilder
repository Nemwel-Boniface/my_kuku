json.extract! blog, :id, :blog_image, :blog_title, :date_created, :comments_counter, :blog_text, :created_at,
              :updated_at
json.url blog_url(blog, format: :json)
