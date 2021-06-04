class CreateRecruitUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :recruit_users do |t|

      t.integer :user_id
      t.integer :recruitement_id
      t.text :recruitement_comment
      t.boolean :join, default: false

      t.timestamps
    end
  end
end
