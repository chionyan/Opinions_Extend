class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :age, presence: true, numericality: {
            only_integer: true, greater_than_or_equal_to: 0,
            less_than_or_equal_to: 150
          }
  validates :sex, presence: true, length: { maximum: 10 }
  has_secure_password
  
  has_many :question_masters
  has_many :answers
  has_many :text_answers
end
