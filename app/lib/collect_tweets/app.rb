class CollectTweets::App
  include MyTwitter::Client

  def foo
    obj = @my_twitter_client.status(878909511007821824, { tweet_mode: "extended" })
    obj.attrs[:full_text]
  end
end