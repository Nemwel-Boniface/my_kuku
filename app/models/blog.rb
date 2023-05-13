class Blog < ApplicationRecord
  # Friendly for the custom slug
  extend FriendlyId
  friendly_id :blog_title, use: :slugged

  belongs_to :user
  has_one_attached :blog_image
  after_save :update_blogs_counter

  def update_blogs_counter
    user.increment!(:blogs_counter)
  end

  def to_param
    slug
  end
end
