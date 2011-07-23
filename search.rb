require 'OneHitWonder'
module OneHitWonder
  class Search
    #returns english language retweets
    def Search.get_retweets()
      tweets = Array.new
      search = Twitter::Search.new.containing('').retweets.language('en')
      
      tweets += search.fetch
      
      tweets.each do |t|
        user = Twitter.user(t.from_user.to_s)
        if user.followers_count > 100
          tweets.delete(t)
        end
      end
      
      #somehow look at original tweet, see retweet_count, see how to 
      
    end
  end
end