class CheckTweets::Duplicated
  include MyTwitter::Client

  def duplicated_tweeted_twitter_user_id_str_and_its_count
    # TODO: 以下の部分は汎用的に切り出すときっと便利（二つのモデルにまたがるので場所は要検討）
    # valid_tweets_and_its_users = []
    # TargetTweet.valid_vote.each do |tweet|
    #   inserted_hash = {}
    #   inserted_hash['twitter_user_id'] = tweet.target_user.twitter_user_id
    #   inserted_hash['tweet_id'] = tweet.tweet_id

    #   valid_tweets_and_its_users << inserted_hash
    # end

    tweeted_twitter_user_ids = []
    TargetTweet.valid_vote.each do |tweet|
      tweeted_twitter_user_ids << tweet.target_user.twitter_user_id
    end

    shown_twitter_user_id_count = Hash.new(0)
    tweeted_twitter_user_ids.each do |twitter_user_id|
      shown_twitter_user_id_count[twitter_user_id.to_s] += 1
    end

    duplicated_tweeted_twitter_user_id_str_and_its_count = []
    shown_twitter_user_id_count.each do |twitter_user_id, shown_count|
      if shown_count >= 2
        inserted_hash = {}

        inserted_hash['twitter_user_id_str'] = twitter_user_id.to_s
        inserted_hash['count'] = shown_count

        duplicated_tweeted_twitter_user_id_str_and_its_count << inserted_hash
      end
    end

    duplicated_tweeted_twitter_user_id_str_and_its_count
  end

  def duplicated_tweet_ids
    duplicated_tweet_ids = []

    duplicated_tweeted_twitter_user_id_str_and_its_count.each do |twitter_user_id_str, _|
      TargetUser.where(twitter_user_id: twitter_user_id_str.to_i).each do |target_user|
        TargetTweet.where(target_tweet_id: target_user.id).each do |tweet|
          duplicated_tweet_ids << tweet.tweet_id
        end
      end
    end

    duplicated_tweet_ids
  end

  # tweet_id_and_can_see_tweet = [{ tweet_id_str: "123456", can_see_tweet: true }, ...]
  def tweet_id_and_can_see_tweet(tweet_ids_array)
    fetch_interval = 10
    tweet_id_and_can_see_tweet = []

    tweet_ids_array.each do |tweet_id|
      inserted_hash = {}

      inserted_hash['tweet_id_str']   = tweet_id.to_s
      inserted_hash['can_see_tweet']  = @my_twitter_client.status(tweet_id).nil? ? false : true

      tweet_id_and_can_see_tweet << inserted_hash
      sleep fetch_interval
    end

    tweet_id_and_can_see_tweet
  end
end
# valid_tweets_and_its_users.each do |tweet_and_user_hash|
