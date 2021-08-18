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
    end
  
    def create
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

      if !current_user
        flash[:message] = "You may only edit your own ferret details."
        redirect_to ferrets_path
      end
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
      if !current_user
        flash[:message] = "You may only delete your own ferret listings."
        redirect_to ferrets_path
      else
        @ferret = Ferret.find(params[:id])
        @ferret.destroy
        redirect_to ferrets_path
      end
    end

    private

	def ferret_params
	  params.require(:ferret).permit(:name, :age, :sex, :color, :health, :description, :home)
	end


end