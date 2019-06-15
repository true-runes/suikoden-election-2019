class Results::RecommendedLinesController < ApplicationController
  def index
    recommended_lines_csv_file = Rails.root.join('db', 'recommended_lines.csv')
    @recommended_lines_from_csv = CSV.read(recommended_lines_csv_file)
  end
end
