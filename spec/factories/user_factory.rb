FactoryBot.define do
  factory :user do
    email 'dawid@example.com'
    password 'pass123'
    
    trait :admin do
      admin true
    end
  end
end