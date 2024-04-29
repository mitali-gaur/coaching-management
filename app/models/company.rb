# frozen_string_literal: true

class Company < ApplicationRecord
  # Associations
  has_many :coaching_programs
  has_many :coaching_sessions, through: :coaching_programs
  has_many :employees, through: :coaching_sessions

  # Validations
  validates :name, :description, presence: true
end
