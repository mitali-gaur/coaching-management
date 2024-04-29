# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :load_company, only: :show

  # GET /companies/:id
  def show; end

  private

  def load_company
    @company = Company.find_by(id: params[:id])
    unless @company
      flash[:alert] = 'Requested Company not found'
      redirect_to request.referrer || root_path
    end
  end
end
