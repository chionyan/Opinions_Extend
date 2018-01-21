FactoryBot.define do
  factory :option do
    association :question_master
    content { Faker::Lorem.sentence }
    
    factory :Radio do
      type 'Radio'
    end

    factory :Check do
      type 'Check'
    end
    
  end
end
