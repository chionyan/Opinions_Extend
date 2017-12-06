class QuestionMaster < ApplicationRecord
  belongs_to :user
  
  validates :question_type, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :deadline, presence: true
  
 
  has_many :options, inverse_of: :question_master
  has_many :radio_options, class_name: "RadioOption", inverse_of: :question_master
  has_many :check_options, class_name: "CheckOption", inverse_of: :question_master
  accepts_nested_attributes_for :options #, allow_destroy: true
  accepts_nested_attributes_for :radio_options, allow_destroy: true
  accepts_nested_attributes_for :check_options, allow_destroy: true
  
  has_many :answers
  has_many :textanswers, class_name: "TextAnswer"
  has_many :radioanswers, class_name: "RadioAnswer"
  has_many :checkanswers, class_name: "CheckAnswer", inverse_of: :question_master
  accepts_nested_attributes_for :checkanswers, allow_destroy: true
end
