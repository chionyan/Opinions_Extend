FactoryBot.define do
  factory :question_master do
    association :user
    sequence(:id) { |n| n }
    question_type ["Radio","Check","Text"].sample
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    deadline { Faker::Time.forward(rand(1..100), :all) }
    
    after(:create) do |question_master|
      rand(1..5).times do
        options << create(:option, 
          question_master: question_master,
          type: question_type
        )
      end
    end

  end
end
