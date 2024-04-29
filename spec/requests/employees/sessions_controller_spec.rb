require 'rails_helper'

RSpec.describe 'Employees::SessionsController', type: :request do
  let!(:company) { create(:company) }
  let!(:coaching_program) { create(:coaching_program, company: company) }
  let!(:coaching_session) { create(:coaching_session, coaching_program: coaching_program) }
  let!(:employee) { coaching_session.employee }

  describe 'POST #create' do
    context 'when employee belongs to the company' do
      before do
        post new_employee_session_path(id: company.id), params: { id: company.id, employee: { email: employee.email, password: employee.password } }
      end

      it 'signs in the employee' do
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(flash[:notice]).to eq('Signed in successfully.')
      end
    end

    context 'when employee does not belong to the company' do
      let!(:another_company) { create(:company) }
      let!(:coaching_program) { create(:coaching_program, company: another_company) }
      let!(:coaching_session) { create(:coaching_session, coaching_program: coaching_program) }
      let!(:employee) { coaching_session.employee }

      before do
        post new_employee_session_path(id: company.id), params: { id: company.id, employee: { email: employee.email, password: employee.password } }
      end

      it 'does not sign in the employee' do
        expect(response).to redirect_to(new_employee_session_path(id: company.id))
        follow_redirect!
        expect(flash[:alert]).to eq('User not found for this company')
      end
    end
  end
end
