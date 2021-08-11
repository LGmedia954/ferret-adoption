class OwnersController < ApplicationController
    #skip_before_action :verified_user, only: [:new, :create]
    
    def index
      @owners = Owner.all
    end

    def show
      @owner = Owner.find(params[:id])
    end

    def new
      @owner = Owner.new
    end

    def create
      @owner = Owner.new(owner_params)
      if @owner.save
        redirect_to owner_path(@owner)
      else
        render :new
      end 
    end
    
    def edit
      @owner = Owner.find(params[:id])
    end

    def update
      @owner = Owner.find(params[:id])
      @owner.update(owner_params)
      redirect_to owner_path(@owner)
    end

    private

    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email, :phone, :zipcode, :password, :quantity)
    end

end