class Salary < ApplicationRecord
  belongs_to :staff
  validates :staff, :salary, :from_date, :to_date, presence: true
  validates :salary, presence: true, numericality: {greater_than: 0}
end
