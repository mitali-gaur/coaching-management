class CreateJoinTableCoachesCoachingPrograms < ActiveRecord::Migration[7.0]
  def change
    create_join_table :coaches, :coaching_programs do |t|
      t.index :coach_id
      t.index :coaching_program_id
    end
  end
end
