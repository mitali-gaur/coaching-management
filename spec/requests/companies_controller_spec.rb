require 'rails_helper'

RSpec.describe 'CompaniesController', type: :request do
  let(:company) { create(:company) }

  describe 'GET #show' do
    context 'when company exists' do
      before { get company_path(company) }

      it 'returns ok http response' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'assigns @company' do
        expect(assigns(:company)).to eq(company)
      end
    end

    context 'when company does not exist' do
      before { get company_path(id: 'invalid_id') }

      it 'returns redirection' do
        expect(response).to redirect_to(root_path)
      end

      it 'returns not found error' do
        expect(flash[:alert]).to eq("Requested Company not found")
      end
    end
  end
end
