# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  # GET /companies/:id/employees/sign_up
  def new
    @company = Company.find_by(id: params[:id])
    super
  end

  #  POST /companies/:id/employees
  def create
    employee = Employee.new(employee_params)
    if employee.save
      flash[:notice] = 'User signed up successfully!!'
      sign_in employee
      redirect_to root_path
    else
      flash[:alert] = employee.errors.full_messages
      redirect_to new_employee_registration_path(id: params[:id])
    end
  end

  private

  def employee_params
    params.require(:employee).permit(
      :name, :email, :password, :phone_number, coaching_session_attributes: [:coach_id, :coaching_program_id, :description, :coaching_timing]
    )
  end
end
