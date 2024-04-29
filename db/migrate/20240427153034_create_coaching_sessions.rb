class CreateCoachingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :coaching_sessions do |t|
      t.text :description
      t.datetime :coaching_timing
      t.references :coaching_program
      t.references :employee
      t.references :coach

      t.timestamps
    end
  end
end
