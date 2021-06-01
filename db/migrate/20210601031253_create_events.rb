class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.integer :user_id
      t.integer :area_id
      t.string :title
      t.text :event_introduction
      t.datetime :start
      t.datetime :end
      t.integer :event_image
      t.timestamps
    end
  end
end
