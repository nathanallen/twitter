get '/' do

  erb :home
end

# get '/:username' do
#   @user = User.find_by_screen_name(params[:username])

#   unless @user
#     @user = User.new(screen_name: params[:username])
#     @user.save
#   end

#   @tweets = @user.fetch_tweets!
#   puts @tweets

#   erb :tweets

#   # 10.times do |i|
#   #   puts "#{t[i][:text]}"
#   # end

#   # Twitter.search("ycombinator", :count => 10, :result_type => "recent").results.map do |status|
#   # "#{status.from_user}: #{status.text} \n"
#   # end

# end

post '/username' do
unless params[:username].empty?
  @user = User.find_by_screen_name(params[:username])

  unless @user
    @user = User.new(screen_name: params[:username])
    @user.save
  end

  # if @user.tweets_stale?
  #   erb :beachball, layout: false
  # else
    @tweets = @user.fetch_tweets!
    erb :tweets, layout: false
  # end
end
end