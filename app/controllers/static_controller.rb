class StaticController < ApplicationController
    before_action :require_logged_in
    skip_before_action :require_logged_in, only: [:home]

    def home
      render "/static/home"
    end

    def about
      render "about"
    end
  
  end