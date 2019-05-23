class Staff < ApplicationRecord
    has_many  :salaries, dependent: :destroy
    before_save :downcase_username
    validates :name, presence: true, length: { maximum: 50 }
    validates :base_salary, :birth_date, :status, presence: true
    validates :gender, presence: true, inclusion: { in: ['male', 'female', 'other'] }
    validates presence: true
    validates :title, presence: true, length: { minimum:1, maximum:100 }
    validates :username, presence: true, length: {minimum: 5, maximum: 50},
              format: { with: /^[a-zA..Z\s]{5,50}$/ },
              uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    private
    def downcase_username
        self.username = username.downcase
    end
end
