class ApplicationController < ActionController::Base
  def logout
    session[:user_name] = nil
    render("top/top")
  end

  def forbid_login_user
    if session[:user_name] == nil
      redirect_to("/top/top")
    end
  end
end
