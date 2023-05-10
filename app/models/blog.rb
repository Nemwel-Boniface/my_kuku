class Blog < ApplicationRecord
  belongs_to :user
  has_one_attached :blog_image
  after_save :update_blogs_counter

  def update_blogs_counter
    user.increment!(:blogs_counter)
  end
end
