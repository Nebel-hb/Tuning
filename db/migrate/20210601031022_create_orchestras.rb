class CreateOrchestras < ActiveRecord::Migration[5.2]
  def change
    create_table :orchestras do |t|

      t.integer :user_id
      t.text :application_comment

      t.timestamps
    end
  end
end
