class Spreadsheets::WriteToSheet
  def self.execute
    session = GoogleDrive::Session.from_config('config/google_drive_api.json')
    target_sheet = session.spreadsheet_by_key(ENV['GOOGLE_DRIVE_API_KEY']).worksheets[1]

    # TODO: リファクタリングする
    # rubocop:disable Lint/UselessAssignment
    start_row_number    = 2
    # rubocop:enable Lint/UselessAssignment
    start_column_number = 20

    # TODO: RTは除外、@gensosenkyo は除外、など
    10.times do |i|
      tweet = TargetTweet.find(750 + i)['text']
      target_sheet[2 + i, start_column_number] = tweet
    end

    target_sheet.save
  end
end
