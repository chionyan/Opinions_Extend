class Option < ApplicationRecord
  validates :type, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  
  belongs_to :question_master, inverse_of: :options
end
