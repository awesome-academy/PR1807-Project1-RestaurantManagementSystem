class ReservedDish < ApplicationRecord
  belongs_to :reservation
  belongs_to :dish
  validates :quantity, presence: true, numericality: {greater_than: 0}
end
