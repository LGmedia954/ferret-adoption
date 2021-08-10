class OwnersController < ApplicationController
    
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
        @owner = Owner.new
        @owner.name = params[:first_name]
        @owner.name = params[:last_name]
        @owner.age = params[:email]
        @owner.sex = params[:phone]
        @owner.color = params[:zipcode]
        @owner.health = params[:password_digest]
        @owner.description = params[:quantity]
        @owner.save
        redirect_to owner_path(@owner)
      end 

    def edit
      @owner = Owner.find(params[:id])
    end


end