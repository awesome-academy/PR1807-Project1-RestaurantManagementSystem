class ReservedDish < ApplicationRecord
    belong_to :reservation
    belong_to :dish
    validates :reservation, :dish, presence: true
    validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
end
