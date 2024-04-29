require 'rails_helper'

RSpec.describe CoachingSession, type: :model do
  subject(:coaching_session) { create(:coaching_session) }

  describe 'associations' do
    it { is_expected.to belong_to(:employee) }
    it { is_expected.to belong_to(:coach).optional(true) }
    it { is_expected.to belong_to(:coaching_program) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:coaching_timing) }
  end

  describe 'delegations' do
    it 'delegates company to coaching_program' do
      expect(coaching_session.company).to eq(coaching_session.coaching_program.company)
    end
  end
end
