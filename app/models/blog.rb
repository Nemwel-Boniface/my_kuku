class Blog < ApplicationRecord
  # validations
  validates :blog_image, presence: true
  validates :blog_title, presence: true
  validates :blog_intro, presence: true
  validates :date_created, presence: true
  validates :comments_counter, presence: true, numericality: { only_integer: true }
  validates :blog_text, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true }

  # Friendly for the custom slug
  extend FriendlyId
  friendly_id :blog_title, use: :slugged

  # associations

  belongs_to :user
  has_many :comments
  has_one_attached :blog_image
  after_save :update_blogs_counter

  def update_blogs_counter
    user.increment!(:blogs_counter)
  end

  def to_param
    slug
  end
end
