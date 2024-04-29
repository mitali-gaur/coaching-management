FactoryBot.define do
  factory :coaching_session do
    description { 'test' }
    coaching_timing { DateTime.now }
    coaching_program { create(:coaching_program) }
    employee { create(:employee) }
    coach { create(:coach) }
  end
end
