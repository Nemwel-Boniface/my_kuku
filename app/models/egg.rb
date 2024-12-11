class Egg < ApplicationRecord
  # Egg associations

  # Enums
  EGG_SIZE = %w[Small Medium Large].freeze

  POULTRY_TYPES = %w[Chicken Duck Goose Turkey Quail].freeze

  validates :poultry_type, presence: true, inclusion: { in: POULTRY_TYPES }

  # Validations
  validates :egg_size, presence: true, inclusion: { in: EGG_SIZE }
  validates :egg_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :laid_on, presence: true
end
