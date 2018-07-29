FactoryBot.define do
  factory :user do
    email 'dawid@example.com'

    trait :admin do
      admin true
    end
  end
end