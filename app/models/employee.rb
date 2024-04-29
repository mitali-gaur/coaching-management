class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #  Associations
  has_one :coaching_session

  # Validations
  validates :name, presence: true

  # Delegates
  delegate :coach, to: :coaching_session
  delegate :coaching_program, to: :coaching_session
  delegate :company, to: :coaching_program

  # Callbacks
  after_initialize :initialize_coaching_session

  # Nested attributes
  accepts_nested_attributes_for :coaching_session

  private

  def initialize_coaching_session
    build_coaching_session unless coaching_session
  end
end
