class Pages::StaffsController < ApplicationController
  def index
    @staffs = Constants::STAFFS
  end
end
