class Spreadsheets::WriteToSheet
  # TODO: 「スプレッドシート」→「シート」で名前空間を切ると DRY になる
  def initialize
    @session = GoogleDrive::Session.from_config('config/google_drive_api.json')
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
end
