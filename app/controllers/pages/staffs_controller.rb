module Pages
  class StaffsController < ApplicationController
    def index
      @staffs = Constants::STAFFS
    end
  end
end
