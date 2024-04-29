FactoryBot.define do
  factory :coach do
    name { 'Coach1' }
    sequence(:email) { |n| "coach#{n}@gmail.com" }
    password { '111111' }
  end
end
