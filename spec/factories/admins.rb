FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@gmail.com" }
    password { '111111' }
  end
end
