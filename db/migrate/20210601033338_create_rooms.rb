class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

      t.integer :user_id
      t.integer :recruitment_id
      t.string :room_name
      t.timestamps
    end
  end
end
