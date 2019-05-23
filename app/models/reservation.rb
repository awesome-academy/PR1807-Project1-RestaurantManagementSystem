class Reservation < ApplicationRecord
   has_many  :reserved_dishes, dependent: :destroy
   belong_to :table
   belong_to :user 
   validates :user, :table, :status, :numbers_people, :datetime, presence: true
end
