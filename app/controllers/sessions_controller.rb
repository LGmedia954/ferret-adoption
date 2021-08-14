class SessionsController < ApplicationController

    def new
    end
  
    def create
      owner = Owner.find_by(email: params[:owner][:email])
  
      owner = owner.try(:authenticate, params[:owner][:password])
      
      return redirect_to(controller: 'sessions', action: 'new') unless owner
  
      session[:owner_id] = owner.id
  
      @owner = owner
  
      redirect_to controller: 'welcome', action: 'home'
    end
  
    def destroy
      session.delete :owner_id
  
      redirect_to '/'
    end


end