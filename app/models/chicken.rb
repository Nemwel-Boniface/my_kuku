class Chicken < ApplicationRecord
  # Custom slug config here
  extend FriendlyId
  friendly_id :poultry_type, use: :slugged

  def to_param
    slug
  end

  # Enums with string values
  enum poultry_type: {
    chicken: "chicken",
    duck: "duck",
    goose: "goose",
    turkey: "turkey",
    quail: "quail"
  }, _prefix: true

  validates :poultry_type, presence: true, inclusion: { in: poultry_types.keys }
  validates :no_of_poultry, numericality: { greater_than: 0 }

  # Associations
  belongs_to :user
  has_one_attached :chicken_image
  has_many :eggs, dependent: :destroy

  # Callback for custom methods
  before_create :calculate_age
  before_create :set_price_per_poultry

  # Calculate total price for all poultry
  def total_price
    no_of_poultry * price_per_poultry
  end

  # Calculate price for a specific poultry type (e.g., Chicken, Duck, etc.)
  def self.price_by_type(type)
    where(poultry_type: type).sum(:price_per_poultry)
  end

  private

  def calculate_age
    if date_hatched.present?
      days_old = (Date.today - date_hatched.to_date).to_i
      age_in_weeks = (days_old / 7.0)
      self.age = age_in_weeks.round(2)
    else
      self.age = nil
    end
  end

  # Set the price per poultry based on the poultry_type
  def set_price_per_poultry
    self.price_per_poultry = case poultry_type
                              when "chicken" then 100.0
                              when "duck" then 120.0
                              when "goose" then 150.0
                              when "turkey" then 200.0
                              when "quail" then 80.0
                              else 0.0
                              end
  end
end
