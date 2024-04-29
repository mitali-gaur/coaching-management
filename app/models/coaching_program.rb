# frozen_string_literal: true

class CoachingProgram < ApplicationRecord
  # Associations
  belongs_to :company
  has_many :coaching_sessions
  has_many :employees, through: :coaching_sessions
  has_and_belongs_to_many :coaches

  # Validations
  validates :name, :description, presence: true
end
