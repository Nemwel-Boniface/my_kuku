class Comment < ApplicationRecord
  belongs_to :blog

  after_save :update_comments_counter

  def update_comments_counter
    blog.increment!(:comments_counter)
  end
end
