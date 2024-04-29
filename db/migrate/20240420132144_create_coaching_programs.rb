class CreateCoachingPrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :coaching_programs do |t|
      t.string :name
      t.string :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
