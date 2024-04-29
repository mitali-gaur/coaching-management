# frozen_string_literal: true

class HomeController < ApplicationController

  # GET /
  def index
    if current_admin
      redirect_to '/admin'
    elsif current_coach
      @coaching_sessions = current_coach.coaching_sessions.page(params[:session_page])
      @coaching_programs = current_coach.coaching_programs
      @companies = current_coach.companies.uniq

      render 'home/coach'
    elsif current_employee
      @coaching_program = current_employee.coaching_program
      @company = @coaching_program.company

      render 'home/employee'
    else
      @companies = Company.all
    end
  end
end
