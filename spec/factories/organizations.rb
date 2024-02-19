FactoryBot.define do
  factory :organization do
    sequence :title do |n|
      "title-#{n}"
    end
  end
end
