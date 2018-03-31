class AddTweetsToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :picture, :string
  end
end
