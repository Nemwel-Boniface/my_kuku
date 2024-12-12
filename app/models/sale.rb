class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items, dependent: :destroy

  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true
end
