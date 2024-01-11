class Chicken < ApplicationRecord
  # Custom slug config here
  extend FriendlyId
  friendly_id :tag_number, use: :slugged

  def to_param
    slug
  end
  
  # Associations
  belongs_to :user
  has_one_attached :chicken_image

  # Callback for custom methods
  before_create :generate_tag_number
  before_create :calculate_age

  private

  def generate_tag_number
    # Get the corrent month eh June
    current_month = Date.today.strftime('%B')

    # Get the current date in the month
    current_date = Date.today.strftime('%d')

    id = Chicken.count + 1

    # Let's append a few zeros before the ID of the record being created
    tag_number_with_zeros = format('%03d', id)

    # Now let's wire them all up together
    self.tag_number = "#{current_month}#{current_date}#{tag_number_with_zeros}"
  end

  def calculate_age
    if date_hatched.present?
      days_old = (Date.today - date_hatched.to_date).to_i
      age_in_weeks = (days_old / 7.0)
      self.age = age_in_weeks.round(2)
    else
      self.age = nil
    end
  end

end
