require 'rails_helper'

RSpec.describe CoachingProgram, type: :model do
  subject(:coaching_program) { create(:coaching_program) }

  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:coaching_sessions) }
    it { is_expected.to have_many(:employees).through(:coaching_sessions) }
    it { is_expected.to have_and_belong_to_many(:coaches) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
