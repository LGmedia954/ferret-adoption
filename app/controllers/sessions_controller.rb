class SessionsController < ApplicationController

    def new
    end
  
    def create
        owner = Owner.find_by(email: params[:session][:email].downcase)

        if owner && owner.authenticate(params[:session][:password])

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