# TODO: 全てに渡って DRY でない
class Spreadsheets::WriteToSheet
  # TODO: 「スプレッドシート」→「シート」で名前空間を切ると DRY になる
  def initialize
    @session = GoogleDrive::Session.from_config('config/google_drive_api.json')
  end

  def gensui_oshi_serifu
    target_sheet_id = 1787259022
    target_sheet = @session.spreadsheet_by_key(ENV['SPREADSHEETS_COUNTING_VOTES']).worksheet_by_sheet_id(target_sheet_id)

    start_row_number = 2
    start_column_number = 2

    # TODO: N + 1 problem
    TargetTweet.gensui_oshi_serifu.order('tweeted_at asc').each_with_index do |tweet, i|
      # HACK: マジックナンバーを撲滅するために、列とその内容の情報を YAML かなんかで持ちたい
      target_sheet[start_row_number + i, start_column_number + 0] = tweet.tweet_id
      target_sheet[start_row_number + i, start_column_number + 1] = tweet.target_user.twitter_user_id
      target_sheet[start_row_number + i, start_column_number + 2] = tweet.target_user.screen_name
      target_sheet[start_row_number + i, start_column_number + 3] = tweet.target_user.name
      target_sheet[start_row_number + i, start_column_number + 4] = tweet.text
      target_sheet[start_row_number + i, start_column_number + 5] = tweet.tweeted_at
      target_sheet[start_row_number + i, start_column_number + 6] = %(=HYPERLINK("#{tweet.media_url_https_01}",IMAGE("#{tweet.media_url_https_01}",1)))
      target_sheet[start_row_number + i, start_column_number + 7] = %(=HYPERLINK("#{tweet.media_url_https_02}",IMAGE("#{tweet.media_url_https_02}",1)))
      target_sheet[start_row_number + i, start_column_number + 8] = %(=HYPERLINK("#{tweet.media_url_https_03}",IMAGE("#{tweet.media_url_https_03}",1)))
      target_sheet[start_row_number + i, start_column_number + 9] = %(=HYPERLINK("#{tweet.media_url_https_04}",IMAGE("#{tweet.media_url_https_04}",1)))
    end

    target_sheet.save
  end

  def visual_confirmation
    # TODO: 秘匿できるならする
    target_sheet_id = 970993814
    target_sheet = @session.spreadsheet_by_key(ENV['SPREADSHEETS_COUNTING_VOTES']).worksheet_by_sheet_id(target_sheet_id)

    start_row_number = 2
    # TODO: N + 1 problem
    TargetTweet.valid_vote.order('tweet_id desc').each_with_index do |tweet, i|
      # HACK: マジックナンバーを撲滅するために、列とその内容の情報を YAML かなんかで持ちたい
      target_sheet[start_row_number + i, 1] = tweet.target_user.name
      target_sheet[start_row_number + i, 2] = tweet.target_user.screen_name
      target_sheet[start_row_number + i, 3] = tweet.text
      target_sheet[start_row_number + i, 4] = tweet.tweeted_at
      target_sheet[start_row_number + i, 5] = tweet.tweet_id
    end

    target_sheet.save
  end

  def missed_tweets
    # TODO: 秘匿できるならする
    target_sheet_id = 1051904817
    target_sheet = @session.spreadsheet_by_key(ENV['SPREADSHEETS_COUNTING_VOTES']).worksheet_by_sheet_id(target_sheet_id)

    start_row_number = 2
    # TODO: N + 1 problem
    missed_tweets = TargetTweet.where(tweet_id: Constants::MERGED_MISSED_TWEET_IDS)
    missed_tweets.each_with_index do |tweet, i|
      # HACK: マジックナンバーを撲滅するために、列とその内容の情報を YAML かなんかで持ちたい
      target_sheet[start_row_number + i, 1] = tweet.target_user.name
      target_sheet[start_row_number + i, 2] = tweet.target_user.screen_name
      target_sheet[start_row_number + i, 3] = tweet.text
      target_sheet[start_row_number + i, 4] = tweet.tweeted_at
      target_sheet[start_row_number + i, 5] = tweet.tweet_id
    end

    target_sheet.save
  end
end
