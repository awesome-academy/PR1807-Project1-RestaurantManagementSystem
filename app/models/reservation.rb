class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table, optional: true
  has_many  :reserved_dishes, dependent: :destroy
  accepts_nested_attributes_for :reserved_dishes,
    reject_if: proc { |attributes| attributes["dish_id"].blank? || attributes["quantity"].blank? },
    allow_destroy: true

  validates :user, :date_time, presence: true
  validates :numbers_people, presence: true, numericality: {greater_than_or_equal_to: 0}
end
