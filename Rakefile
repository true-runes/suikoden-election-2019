# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :oshi_serifu do
  desc "Insert 'Gensui Oshi-Serifu to database'"
  task insert: :environment do
    CollectTweets::Execute.new.call_with_tweet_ids(
      Constants::GENSUI_OSHI_SERIFU_TWEET_IDS,
      collect_way: 4,
      parameter: 'gensui_oshi_serifu',
    )
  end

  desc 'Show the number of Oshi-Sefiru record'
  task count: :environment do
    p TargetTweet.gensui_oshi_serifu.count
  end
end
