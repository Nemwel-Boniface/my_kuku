class SaleItem < ApplicationRecord
  belongs_to :sale

  validates :item_type, presence: true, inclusion: { in: %w[Eggs Poultry] }
  validates :category, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validates :price_per_unit, numericality: { greater_than_or_equal_to: 0 }
end
