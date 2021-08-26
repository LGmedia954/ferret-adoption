class OwnersController < ApplicationController
    before_action :require_logged_in
    skip_before_action :require_logged_in, only: [:new, :create]
  
    def index
      @owners = Owner.all.sort_name  #scope
    end

    def show
      @owner = Owner.find(params[:id])
    end

    def new
      @owner = Owner.new
    end

    def create
      @owner = Owner.create(owner_params)
        if @owner.save
          flash[:success] = "Welcome to Ferret Adoption!"
          session[:owner_id] = @owner.id
          redirect_to controller: 'welcome', action: 'home'
        else
          render 'new'
        end
    end

    def busyness
      @owner = Owner.find(session[:owner_id])
      @ferrets = Ferret.where(:owner_id => current_user.id)
      render 'busyness'
    end
    
    def edit
      @owner = Owner.find(params[:id])

      if !current_user
        flash[:message] = "You may only edit your own account."
        redirect_to owners_path
      end
    end

    def update
      @owner = Owner.find(params[:id])
      @owner.update(owner_params)
      if @owner.save
        flash[:message] = "Details updated."
        redirect_to owner_path(@owner)
      else
        render :edit
      end
    end

    def destroy
      @owner = Opportunity.find(params[:id])
      if !current_user
        flash[:message] = "You may only delete your own account."
        redirect_to owners_path
      else
        @owner.destroy
        redirect_to '/'
      end
    end

    private

    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email, :phone, :zipcode, :quantity, :password, :password_confirmation)
    end

end