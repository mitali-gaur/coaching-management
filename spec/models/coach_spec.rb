require 'rails_helper'

RSpec.describe Coach, type: :model do
  subject(:coach) { create(:coach) }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:coaching_programs) }
    it { is_expected.to have_many(:companies).through(:coaching_programs) }
    it { is_expected.to have_many(:coaching_sessions) }
    it { is_expected.to have_many(:employees).through(:coaching_sessions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
