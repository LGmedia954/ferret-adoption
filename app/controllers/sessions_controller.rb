class SessionsController < ApplicationController

    def new
    end
  
    def create
      #byebug
        owner = Owner.find_by(email: params[:owner][:email].downcase)

        if owner && owner.authenticate(params[:owner][:password])

          log_in owner

          redirect_to controller: 'welcome', action: 'home'

        else
          flash.now[:danger] = 'Invalid email/password combination'
          return redirect_to(controller: 'sessions', action: 'new')
        end
    end
  
    def destroy
      session.delete :owner_id
  
      redirect_to '/'
    end


end