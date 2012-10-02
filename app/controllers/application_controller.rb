class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_user

  private 
    def current_user
      if session[User.sessionSymbol]
        @user = User.find(session[User.sessionSymbol])
      else
        @user=nil
      end
    end

    def require_user
      puts "trying to require user"
      if current_user == nil
        render 'users/login' 
      end
    end
end
