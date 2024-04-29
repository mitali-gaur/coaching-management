require 'rails_helper'

RSpec.describe 'CoachesController', type: :request do
  let(:company) { create(:company) }
  let(:coaching_program) { create(:coaching_program, company: company) }
  let(:coaches) { create_list(:coach, 3) }

  before do
    coaches.first.coaching_programs << coaching_program
    coaches.last.coaching_programs << coaching_program
  end

  describe 'GET #index' do
    context 'when coaching_program_id is provided' do
      before { get coaches_path(company_program_id: coaching_program.id) }

      it 'returns ok http response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns coaches for the coaching program' do
        expect(JSON.parse(response.body)['coaches'].count).to eq(2)
      end
    end

    context 'when coaching_program_id is not provided' do
      before { get coaches_path }

      it 'returns ok http response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty array of coaches' do
        expect(JSON.parse(response.body)['coaches']).to eq([])
      end
    end
  end
end
