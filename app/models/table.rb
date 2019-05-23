class Table < ApplicationRecord
    has_many  :reservations, dependent: :destroy 
    validates :status, presence: true, inclusion: { in: [true, false] }
end
