module SessionsHelper

    def log_in(owner)
      session[:owner_id] = owner.id
    end
  end