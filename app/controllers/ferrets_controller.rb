class FerretsController < ApplicationController

    def index
      @ferrets = Ferret.all
    end

    def show
      @ferret = Ferret.find(params[:id])
    end


end