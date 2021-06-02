class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|

      t.integer :user_id
      t.integer :area_id
      t.string :title
      t.text :recruit_introduction
      t.datetime :recruit_start
      t.datetime :recruit_end

      t.timestamps
    end
  end
end
