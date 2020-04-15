require 'pry'
require 'dotenv'
require 'twitter'

Dotenv.load('.env') 

  config = {
    consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  }

  rclient = Twitter::REST::Client.new(config)
  sclient = Twitter::Streaming::Client.new(config)


  sclient.filter(track: "#hogwarts") do |tweet|
  if tweet.is_a?(Twitter::Tweet)
      puts tweet.text 
      rclient.favorite(tweet)
      rclient.follow(tweet.user.id)
  end
end
end
 
# def self.search_words words 
#   CLIENT.search(words, lang: "fr").first.text 
# end