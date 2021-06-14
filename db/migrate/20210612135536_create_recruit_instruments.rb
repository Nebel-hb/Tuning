class CreateRecruitInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_instruments do |t|
      t.integer :instrument_id
      t.integer :recruitment_id
      t.integer :need_people
      t.integer :finded_people
      t.boolean :find_all, default: false
      
      t.timestamps
    end
  end
end
