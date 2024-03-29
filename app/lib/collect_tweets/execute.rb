# rubocop:disable Layout/LineLength, Naming/VariableNumber
module CollectTweets
  class Execute
    include MyTwitter::Client

    # TODO: メソッド名がわかりにくい
    def call
      # TODO: これだと、100ツイート以内に最新ツイートが収まらない場合に取得漏れが発生する
      # TODO: したがって、既存ツイートの ID に達するまでにループを回すことが本当は必要
      # TODO: その際も、「検索結果は『上』から調べていく」ということに留意する必要がある
      since_id = TargetTweet.all.order('tweet_id desc').first.nil? ? 1 : TargetTweet.all.order('tweet_id desc').first.tweet_id
      searched_tweets = search(target_search_word: '#幻水総選挙2019', target_since_id: since_id, target_max_id: nil,
                               target_count: 100)
      record_to_db(searched_tweets, collect_way: 1, parameter: 'call')
    end

    # TODO: メソッド名がわかりにくい
    def call_to_past
      # max_id の方を基準にして、idが少ない方に少ない方に検索結果が取得できることに注意！
      # TODO: 10回で決め打ちしているのはあまり賢くない
      10.times do
        max_id = TargetTweet.all.order('tweet_id asc').first.nil? ? 9_999_999_999_999_999_999 : TargetTweet.all.order('tweet_id asc').first.tweet_id - 1 # あまり賢くないが、こうするしかない

        searched_tweets = search(target_search_word: '#幻水総選挙2019', target_since_id: 1, target_max_id: max_id,
                                 target_count: 100)
        record_to_db(searched_tweets, collect_way: 1, parameter: 'call_to_past')
      end
    end

    # TODO: メソッド名がわかりにくい
    def call_with_tweet_id_range(start_id:, end_id:)
      searched_tweets = search(target_search_word: '#幻水総選挙2019', target_since_id: start_id, target_max_id: end_id,
                               target_count: 100)
      record_to_db(searched_tweets, collect_way: 3, parameter: 'call_with_tweet_id_range')
    end

    # TODO: メソッド名がわかりにくい
    # TODO: tweet_ids は Integer を要素とする Array である
    def call_with_tweet_ids(tweet_ids, collect_way:, parameter:)
      # 100以上入れても、いい具合に100ずつに分割してくれるように見えた（要厳密確認）
      target_tweets = @my_twitter_client.statuses(tweet_ids, { tweet_mode: 'extended', result_type: 'recent' })
      record_to_db(target_tweets, collect_way: collect_way, parameter: parameter)
    end

    # TODO: メソッド名がわかりにくい
    # TODO: 全部取り直し用のメソッド
    def call_for_initialize(how_many_executions)
      max_id = 9_999_999_999_999_999_999

      how_many_executions.times do
        searched_tweets = search(target_search_word: '#幻水総選挙2019', target_since_id: 1, target_max_id: max_id,
                                 target_count: 100)
        record_to_db(searched_tweets, collect_way: 1, parameter: 'call_for_initialize')

        searched_tweets.each do |tweet|
          max_id = tweet.attrs[:id] if tweet.attrs[:id] < max_id
        end

        sleep 30
      end
    end

    # max_id は「以下」を示し、since_id は「より大きい」を表す
    # since_id > max_id だとエラーになるので注意
    # TODO: #take は search 以外には使えないかも
    def search(target_search_word:, target_since_id: TargetTweet.all.order('tweet_id desc').first.tweet_id, target_max_id: nil, target_count: 10)
      @my_twitter_client
        .search(
          target_search_word,
          {
            tweet_mode: 'extended',
            result_type: 'recent',
            since_id: target_since_id,
            max_id: target_max_id
          }
        ).take(target_count)
    end

    # TODO: parameter という変数名が一般的すぎて不安
    # rubocop:disable Lint/UnusedMethodArgument
    def record_to_db(target_tweets_object, parameter:, collect_way: 1) # rubocop:disable Metrics/AbcSize
      # rubocop:enable Lint/UnusedMethodArgument
      target_tweets_object.each do |tweet|
        # TODO: nil は一刻も早くやめること
        media_uris = if tweet.attrs[:extended_entities].nil?
                       [nil, nil, nil,
                        nil]
                     else
                       tweet.attrs[:extended_entities][:media].pluck(:media_url_https)
                     end
        extended_url = tweet.attrs[:entites].nil? ? nil : tweet.attrs[:entites][:urls][:extended_url]

        # TODO: User は情報が書き換わることがあり、その場合は find_or_initialize_by だと Duplicate エラーになるんだ……
        # TODO: 超苦肉の策で例外を握りつぶす
        begin
          TargetUser.find_or_initialize_by(
            {
              twitter_user_id: tweet.attrs[:user][:id],
              name: tweet.attrs[:user][:name],
              screen_name: tweet.attrs[:user][:screen_name],
              profile_image_url_https: tweet.attrs[:user][:profile_image_url_https],
              # is_protected: false, # tweet.attrs[:user].protected?,
              lang: tweet.attrs[:user][:lang]
            }
          ).save
        rescue StandardError => e
          Rails.logger.debug '@@@@@ TargetUser.find_or_initialize_by rescue @@@@@'
          Rails.logger.debug e
        end

        # TODO: Tweet は Upsert になることは予想されてないので例外握りつぶしても実質的な問題ないけど、現実的にはダメ
        begin
          TargetTweet.find_or_initialize_by(
            {
              collect_tweet_way_id: collect_way,
              target_user_id: TargetUser.where(twitter_user_id: tweet.attrs[:user][:id]).first.id,
              tweet_id: tweet.attrs[:id],
              text: tweet.attrs[:full_text],
              tweeted_at: tweet.attrs[:created_at],
              media_url_https_01: media_uris[0],
              media_url_https_02: media_uris[1],
              media_url_https_03: media_uris[2],
              media_url_https_04: media_uris[3],
              in_tweet_url: extended_url,
              lang: tweet.attrs[:lang],
              is_retweet: tweet.retweet?
            }
          ).save
        rescue StandardError => e
          # ActiveRecord::RecordNotUnique: PG::UniqueViolation: ERROR:  duplicate key value violates unique constraint "index_target_tweets_on_tweet_id"
          Rails.logger.debug '@@@@@ TargetTweet.find_or_initialize_by rescue @@@@@'
          Rails.logger.debug e
        end
      end
    end
  end
end
# rubocop:enable Layout/LineLength, Naming/VariableNumber
