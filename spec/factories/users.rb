FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password { "password" }
    organizations { [association(:organization)] }
  end
end
