class Category < ApplicationRecord
  has_many  :dishes
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 1, maximum: 1000}
  validates :status, presence: true, inclusion: {in: [true, false]}
end
