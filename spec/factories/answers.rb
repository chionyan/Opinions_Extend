FactoryBot.define do
  factory :answer do
    association :user
    association :question_master
    answer { Faker::Lorem.sentence }
  
    factory :radio_answer do
      type 'Radio'
    end

    factory :check_answer do
      type 'Check'
    end
    
    factory :text_answer do
      type 'Text'
    end
    
  end
end
