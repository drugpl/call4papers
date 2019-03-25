class HomeController < ApplicationController
  def show
    render locals: {
      confirmation_date: Rails.configuration.conference.cfp_ends + 7.days
    }
  end
end
