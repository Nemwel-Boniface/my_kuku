class Egg < ApplicationRecord
  # Egg associations
  belongs_to :chicken

  # Enums
  EGG_SIZE = %w[Small Medium Large].freeze

  # Validations
  validates :egg_size, presence: true, inclusion: { in: EGG_SIZE }
  validates :egg_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :laid_on, presence: true
end
