class FerretsController < ApplicationController
    #before_action :require_logged_in

    def index
      @ferrets = Ferret.all
    end

    def show
      @ferret = Ferret.find(params[:id])
    end

    def new
      @ferret = Ferret.new
      #ferret = @owner.ferrets.build
    end
  
    def create
      #@ferret = Ferret.new(ferret_params)
      @ferret = current_user.ferrets.build(ferret_params)
      if @ferret.save
        flash[:message] = "Ferret added. Dook dook!"
        redirect_to ferret_path(@ferret)
      else
        render :new
      end
    end

    def edit
      @ferret = Ferret.find(params[:id]) 
    end

    def update
      @ferret = Ferret.find(params[:id])
      @ferret.update(ferret_params)
      if @ferret.save
        flash[:message] = "Details updated."
        redirect_to ferret_path(@ferret)
      else
        render :edit
      end
    end

    def destroy
      @ferret = Ferret.find(params[:id])
      @ferret.destroy
      redirect_to ferrets_path
    end

    private

	def ferret_params
	  params.require(:ferret).permit(:name, :age, :sex, :color, :health, :description, :home)
	end


end