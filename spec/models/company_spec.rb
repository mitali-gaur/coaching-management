require 'rails_helper'

RSpec.describe Company, type: :model do
  subject(:company) { create(:company) }

  describe 'associations' do
    it { is_expected.to have_many(:coaching_programs) }
    it { is_expected.to have_many(:coaching_sessions).through(:coaching_programs) }
    it { is_expected.to have_many(:employees).through(:coaching_sessions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
