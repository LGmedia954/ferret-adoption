class SessionsController < ApplicationController

    def new
    end
  
    def create
      if auth
        @owner = Owner.find_or_create_by(uid: auth['uid']) do |o|
          o.name = auth['info']['name']
          o.email = auth['info']['email']
          o.image = auth['info']['image']
        end
        session[:owner_id] = @owner.id
        redirect_to welcome_home_path

      else
        if owner = Owner.find_by(email: params[:session][:email].downcase)

        if owner && owner.authenticate(params[:session][:password])

          log_in owner

          redirect_to controller: 'welcome', action: 'home'

        else
          flash.now[:danger] = 'Invalid email/password combination'
          return redirect_to(controller: 'sessions', action: 'new')
        end
      end
    end
  
    def destroy
      session.delete :owner_id
  
      redirect_to '/'
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end