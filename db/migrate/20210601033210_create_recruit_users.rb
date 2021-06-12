class CreateRecruitUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_users do |t|

      t.integer :user_id
      t.integer :recruitment_id
      t.text :recruit_comment
      t.integer :join, default: 1

      t.timestamps
    end
  end
end
