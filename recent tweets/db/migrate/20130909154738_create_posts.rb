class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.string :tweeted_at
      t.text :tweet_id
      t.belongs_to :user

      t.timestamps
    end
  end
end
