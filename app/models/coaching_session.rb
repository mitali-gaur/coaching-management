# frozen_string_literal: true

class CoachingSession < ApplicationRecord
  # Associations
  belongs_to :employee
  belongs_to :coach, optional: true
  belongs_to :coaching_program

  # Validations
  validates :coaching_timing, presence: true

  # Delegates
  delegate :company, to: :coaching_program
end
