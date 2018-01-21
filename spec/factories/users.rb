FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    age { Faker::Number.between(18, 100) }
    sex  ["男","女","その他"].sample
    password_digest { Faker::Internet.password(10, 20) }
    
    after(:create) do |user|
      rand(1..5).times do
        options << create(:answer, 
          question_master: question_master,
          type: question_type
        )
      end
    end
    
  end
end