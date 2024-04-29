require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject(:employee) { create(:employee) }

  describe 'associations' do
    it { is_expected.to have_one(:coaching_session) }
    it { is_expected.to accept_nested_attributes_for(:coaching_session) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'delegations' do
    let(:coaching_session) { employee.coaching_session }
    let(:coach) { coaching_session.coach }
    let(:coaching_program) { coaching_session.coaching_program }
    let(:company) { coaching_program.company }

    it 'delegates coach to coaching_session' do
      expect(employee.coach).to eq(employee.coaching_session.coach)
    end

    it 'delegates coaching_program to coaching_session' do
      expect(employee.coaching_program).to eq(employee.coaching_session.coaching_program)
    end

    it 'delegates company to coaching_program' do
      expect(employee.coaching_program.company).to eq(employee.company)
    end
  end
end
