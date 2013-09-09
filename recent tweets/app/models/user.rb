class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts

  validates :screen_name, uniqueness: true

  def fetch_tweets!
    if tweets_stale?
      pull_tweets_from_twitter
    end
    ten_newest_tweets
  end

  #can we grab tweets by timestamp instead of getting the 10 most recent?
  def pull_tweets_from_twitter
    ten_twitter_objects = Twitter.user_timeline(self.screen_name, count: 10)
    ten_twitter_objects.each do |tweet|
      parse_and_save(tweet)
    end
  end
private 

  def parse_and_save(t)
    Post.create(text: t.text, tweeted_at: t.created_at, tweet_id: t.id, user_id: self.id)
  end

  def ten_newest_tweets
    self.posts.last(10)
  end

  def tweets_stale?
    if self.posts.last.nil? || Time.now - self.posts.last.created_at > 900
      return true
    else
      return false
    end
  end
end
