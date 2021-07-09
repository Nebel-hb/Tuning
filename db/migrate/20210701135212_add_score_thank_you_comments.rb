class AddScoreThankYouComments < ActiveRecord::Migration[5.2]
  def change
    add_column :thank_you_comments, :score, :integer
  end
end
