class AddTweetedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :tweeted, :boolean
  end
end
