class FerretsController < ApplicationController

    def index
      @ferrets = Ferret.all
    end

    def show
      @ferret = Ferret.find(params[:id])
    end

    def new
    end
  
    def create
      @ferret = Ferret.new(ferret_params)
      @ferret.save
      redirect_to ferret_path(@ferret)
    end 

    def edit
      @ferret = Ferret.find(params[:id]) 
    end

    def update
      @ferret = Ferret.find(params[:id])
      @ferret.update(ferret_params)
      redirect_to ferret_path(@ferret)
    end

    private

	def ferret_params
	  params.require(:ferret).permit(:name, :age, :sex, :color, :health, :description, :home)
	end


end