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
      @owner = Owner.create(owner_params)
      return redirect_to controller: 'owners', action: 'new' unless @owner.save
      session[:owner_id] = @owner.id
      redirect_to controller: 'welcome', action: 'home'
    end
    
    def edit
      @owner = Owner.find(params[:id])
    end

    def update
      @owner = Owner.find(params[:id])
      @owner.update(owner_params)
      flash[:message] = "Updated owner information."
      redirect_to owner_path(@owner)
    end

    def my_busyness
      if logged_in?
        @owner = Owner.find(params[:id])
        @ferrets = Ferret.where(owner: current_user)
      else
        redirect_to ferrets_path
      end
    end

    def destroy
      @owner = Opportunity.find(params[:id])
      @owner.destroy
      redirect_to '/'
    end

    private

    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email, :phone, :zipcode, :quantity, :password, :password_confirmation)
    end

end