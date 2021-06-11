class CreateRecruitUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_users do |t|

      t.integer :user_id
      t.integer :recruitment_id
      t.text :recruit_comment
      t.text :thanks_comment
      t.boolean :join, default: false

      t.timestamps
    end
  end
end
