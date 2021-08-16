class StaticController < ApplicationController
    before_action :require_logged_in

    def about
      render "about"
    end
  
  end