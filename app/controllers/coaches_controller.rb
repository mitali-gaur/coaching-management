# frozen_string_literal: true

class CoachesController < ApplicationController
  before_action :fetch_coaching_program, only: :index

  #  GET /coaches
  def index
    render json: { coaches: [] } and return unless @coaching_program

    render json: { coaches: @coaching_program.coaches }
  end

  private

  def fetch_coaching_program
    @coaching_program = CoachingProgram.find_by(id: params[:company_program_id])
  end
end
