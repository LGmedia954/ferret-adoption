class FerretsController < ApplicationController

    def index
      @ferrets = Ferret.all
    end

    def new
    end
  
    def create
      #Ferret.create
      #redirect_to ferrets_path
    end 

    def show
      @ferret = Ferret.find(params[:id])
    end


end