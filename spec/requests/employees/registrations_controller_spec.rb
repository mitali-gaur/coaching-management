require 'rails_helper'

RSpec.describe 'Employees::RegistrationsController', type: :request do
  let(:company) { create(:company) }
  let(:coaching_program) { create(:coaching_program, company: company) }
  let(:coach) { create(:coach) }

  describe 'GET #new' do
    it 'loads company' do
      get new_employee_registration_path(id: company.id)
      expect(assigns(:company)).to eq(company)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        {
          employee: {
            name: 'John Doe',
            email: 'john@example.com',
            password: 'password',
            phone_number: '1234567890',
            coaching_session_attributes: {
              coach_id: coach.id,
              coaching_program_id: coaching_program.id,
              description: 'Sample description',
              coaching_timing: 1.day.from_now
            }
          }
        }
      end

      it 'creates a new employee' do
        expect {
          post employee_registration_path(id: company.id), params: valid_params.merge(id: company.id)
        }.to change(Employee, :count).by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('User signed up successfully!!')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          employee: {
            name: '',
            email: 'invalid_email',
            password: 'short',
            phone_number: '',
            coaching_session_attributes: {
              coach_id: coach.id,
              coaching_program_id: coaching_program.id,
              description: 'Sample description',
              coaching_timing: 1.day.from_now
            }
          }
        }
      end

      let(:http_request) do
        post employee_registration_path(id: company.id), params: invalid_params.merge(id: company.id)
      end

      it 'does not create a new employee' do
        expect {
          http_request
        }.not_to change(Employee, :count)
      end

      it 'redirect to employee registration with errors' do
        http_request
        expect(response).to redirect_to(new_employee_registration_path(id: company.id))
        expect(flash[:alert]).to include("Name can't be blank", "Email is invalid", "Password is too short (minimum is 6 characters)")
      end
    end
  end
end
