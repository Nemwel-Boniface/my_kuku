class Comment < ApplicationRecord
  # validations
  validates :comment_text, presence: true
  validates :commenter_name, presence: true
  validates :blog_id, presence: true, numericality: { only_integer: true }

  # associations
  belongs_to :blog

  after_save :update_comments_counter

  def update_comments_counter
    blog.increment!(:comments_counter)
  end
end
