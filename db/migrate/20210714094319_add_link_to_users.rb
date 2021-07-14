class AddLinkToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :link, :text
  end
end
