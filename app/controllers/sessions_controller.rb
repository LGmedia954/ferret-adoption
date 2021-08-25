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

  def omniauth
      @owner = Owner.find_or_create_by(uid: auth[:uid]) do |o|
        o.first_name = auth[:info][:name]
        o.email = auth[:info][:email]
      end
      
      if @owner.valid?
        session[:owner_id] = @owner.id
        redirect_to controller: 'welcome', action: 'home'
      else
        flash[:danger] = 'Please try again.'
        redirect_to '/'
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