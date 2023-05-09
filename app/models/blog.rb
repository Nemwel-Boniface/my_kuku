class Blog < ApplicationRecord
  belongs_to :user

  after_save :update_blogs_counter

  def update_blogs_counter
    user.increment!(:blogs_counter)
  end
end
