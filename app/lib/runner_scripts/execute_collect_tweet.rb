# bundle exec rails runner "eval(File.read 'app/lib/runner_scripts/execute_collect_tweet.rb')"
CollectTweets::Execute.new.call
