class CreateRecruitRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_relations do |t|
      t.integer :user_id
      t.integer :recruitment_id
      t.integer :event_id

      t.timestamps
    end
  end
end
