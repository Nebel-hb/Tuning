class CreateThankYouComments < ActiveRecord::Migration[5.2]
  def change
    create_table :thank_you_comments do |t|
      t.integer :user_id
      t.integer :recruitment_id
      t.text :thanks_comment
      t.boolean :join, default: false

      t.timestamps
    end
  end
end
