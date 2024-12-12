class Egg < ApplicationRecord
  # Enums
  EGG_SIZE = %w[Small Medium Large].freeze
  POULTRY_TYPES = %w[Chicken Duck Goose Turkey Quail].freeze

  # Validations
  validates :poultry_type, presence: true, inclusion: { in: POULTRY_TYPES }
  validates :egg_size, presence: true, inclusion: { in: EGG_SIZE }
  validates :egg_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price_per_egg, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :laid_on, presence: true

  # Methods to calculate statistics
  def self.total_eggs_and_prices
    POULTRY_TYPES.each_with_object({}) do |poultry_type, stats|
      eggs = where(poultry_type:)
      total_eggs = eggs.sum(:egg_count)
      total_price = eggs.sum('egg_count * price_per_egg')
      average_price_per_egg = eggs.average(:price_per_egg)

      stats[poultry_type] = {
        total_eggs:,
        total_price:,
        average_price_per_egg:
      }
    end
  end
end
