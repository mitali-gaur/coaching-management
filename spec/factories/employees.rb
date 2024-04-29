FactoryBot.define do
  factory :employee do
    name { 'Mitali' }
    sequence(:email) { |n| "emp#{n}@gmail.com" }
    password { '111111' }
    password_confirmation { '111111' }

    after :build do |emp|
      build(:coaching_session, employee: emp)
    end
  end
end
