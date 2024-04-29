FactoryBot.define do
  factory :coaching_program do
    name { 'Company Program1' }
    description { 'test' }
    company { create(:company) }
  end
end
