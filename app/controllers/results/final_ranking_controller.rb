class Results::FinalRankingController < ApplicationController
  def index
    final_ranking_csv_file = Rails.root.join('db', 'final_ranking.csv')
    @final_ranking_from_csv = CSV.read(final_ranking_csv_file)
  end
end
