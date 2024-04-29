# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  # POST /companies/:id/employees/sign_in
  def create
    company = Company.find_by(id: params[:id])
    employee = Employee.find_by(email: params[:employee][:email])
    unless company.employees.find_by(id: employee.id)
      flash[:alert] = 'User not found for this company'
      redirect_to new_employee_session_path(id: params[:id])
    else
      super
    end
  end
end
