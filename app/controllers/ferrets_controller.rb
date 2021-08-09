class FerretsController < ApplicationController

    def index
      @ferrets = Ferret.all
    end

    def new
    end
  
    def create
      @ferret = Ferret.new
      @ferret.name = params[:name]
      @ferret.age = params[:age]
      @ferret.sex = params[:sex]
      @ferret.color = params[:color]
      @ferret.health = params[:health]
      @ferret.description = params[:description]
      @ferret.save
      redirect_to ferret_path(@ferret)
    end 

    def show
      @ferret = Ferret.find(params[:id])
    end


end