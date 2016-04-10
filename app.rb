require 'countries'
require 'twitter'
require 'language_converter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ARGV[0]
  config.consumer_secret     = ARGV[1]
  config.access_token        = ARGV[2]
  config.access_token_secret = ARGV[3]
end


if ARGV.length == 5
    translated_text =  lc 'Hello', ARGV[4] ,'en'
    tweet_text = "#{translated_text} @udacity! Welcome to Europe. Check out: http://premium.easypromosapp.com/p/217374 #UdacityEurope tweeted w/ https://github.com/vidjon/welcome-udacity"
    if translated_text
        client.update(tweet_text)
        puts "Text tweeted: #{tweet_text}"
    else
        puts "Error in translating text"
    end
else
    puts "App takes 5 arguments (See Readme.md for instructions) : twitter.consumer_key twitter.consumer_secret twitter.access_token twitter.access_token_secret languageCode"
end
