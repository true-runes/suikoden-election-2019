class CheckTweets::Duplicated
  include MyTwitter::Client

  def duplicated_tweeted_twitter_user_id_str_and_its_count
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
      next unless shown_count >= 2

      inserted_hash = {}
      inserted_hash[twitter_user_id.to_s] = shown_count

      duplicated_tweeted_twitter_user_id_str_and_its_count << inserted_hash
    end

    duplicated_tweeted_twitter_user_id_str_and_its_count # [{"585692587"=>3}, ...]
  end

  def duplicated_tweet_ids
    duplicated_tweet_ids = []

    duplicated_tweeted_twitter_user_id_str_and_its_count.each do |user_id_str_and_count_hash|
      duplicated_tweeted_twitter_user_id = TargetUser.find_by(twitter_user_id: user_id_str_and_count_hash.keys.first.to_i)
      TargetTweet.where(target_user_id: duplicated_tweeted_twitter_user_id).each do |tweet|
        duplicated_tweet_ids << tweet.tweet_id
      end
    end

    duplicated_tweet_ids
  end

  # TODO: バルクで取得する
  # tweet_id_and_can_see_tweet = [{ tweet_id_str: "123456", can_see_tweet: true }, ...]
  def tweet_id_and_can_see_tweet(tweet_ids_array)
    fetch_interval = 10
    tweet_id_and_can_see_tweet = []

    tweet_ids_array.each do |tweet_id|
      inserted_hash = {}

      begin
        inserted_hash[tweet_id.to_s] = true if @my_twitter_client.status(tweet_id)
      rescue Twitter::Error => e
        # Twitter::Error::NotFound: No status found with that ID.
        # Twitter::Error::Forbidden: Sorry, you are not authorized to see this status.
        inserted_hash[tweet_id.to_s] = false
        puts "#{e}: #{tweet_id}"
      end

      tweet_id_and_can_see_tweet << inserted_hash
      sleep fetch_interval
    end

    tweet_id_and_can_see_tweet
  end
end
