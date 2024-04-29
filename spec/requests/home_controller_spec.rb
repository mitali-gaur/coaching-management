# spec/requests/home_controller_spec.rb
require 'rails_helper'

RSpec.describe HomeController, type: :request do
  let!(:admin) { create(:admin) }
  let!(:coach) { create(:coach) }
  let!(:employee) { create(:employee) }

  let!(:coaching_program) { create(:coaching_program) }

  describe 'GET #index' do
    context 'when logged in as an admin' do
      before do
        sign_in admin
        get root_path
      end

      after { sign_out admin }

      it 'redirects to the admin page' do
        expect(response).to redirect_to('/admin')
      end
    end

    context 'when logged in as a coach' do
      before do
        coach.update(confirmed_at: DateTime.now)
        coach.coaching_programs << coaching_program
        create(:coaching_session, coach: coach, employee: employee)

        sign_in coach
        get root_path
      end

      after { sign_out coach }

      it 'renders the coach home page' do
        expect(response).to render_template('home/coach')
      end

      it 'assigns @coaching_sessions' do
        expect(assigns(:coaching_sessions)).to be_present
      end

      it 'assigns @coaching_programs' do
        expect(assigns(:coaching_programs)).to be_present
      end

      it 'assigns @companies' do
        expect(assigns(:companies)).to be_present
      end
    end

    context 'when logged in as an employee' do
      before do
        sign_in employee
        get root_path
      end

      after { sign_out employee }

      it 'renders the employee home page' do
        expect(response).to render_template('home/employee')
      end

      it 'assigns @coaching_program' do
        expect(assigns(:coaching_program)).to be_present
      end

      it 'assigns @company' do
        expect(assigns(:company)).to be_present
      end
    end

    context 'when not logged in' do
      before { get root_path }

      it 'assigns @companies' do
        expect(assigns(:companies)).to be_present
      end
    end
  end
end
