json.extract! comment, :id, :comment_text, :commenter_name, :created_at, :updated_at
json.url comment_url(comment, format: :json)
