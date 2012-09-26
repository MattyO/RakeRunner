class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user

  private 
    def current_user
      if session[User.sessionSymbol]
        @user = User.find(session[User.sessionSymbol])
      else
        @user=nil
      end
    end

    def require_user
      if current_user = nil
        redirect_to 'login' 
      end
    end
end
