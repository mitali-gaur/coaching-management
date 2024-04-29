# frozen_string_literal: true

class CoachingSessionsController < ApplicationController

  # GET /coaching_sessions/filter
  def filter
    query = params[:query]
    @coaching_sessions = current_coach.coaching_sessions.joins(:employee, coaching_program: :company)
    @coaching_sessions = @coaching_sessions.where('employees.name LIKE ?', "%#{query}%").or(@coaching_sessions.where('companies.name LIKE ?', "%#{query}%"))
    @coaching_sessions = @coaching_sessions.page(params[:session_page])

    render turbo_stream: turbo_stream.replace('coaching_sessions_frame', partial: 'home/coaching_sessions_list', locals: { coaching_sessions: @coaching_sessions })
  end
end
