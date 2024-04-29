# frozen_string_literal: true

class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable, :invitable

  # Associations
  has_and_belongs_to_many :coaching_programs
  has_many :companies, through: :coaching_programs
  has_many :coaching_sessions
  has_many :employees, through: :coaching_sessions

  # Validations
  validates :name, :email, :password, presence: true
end
