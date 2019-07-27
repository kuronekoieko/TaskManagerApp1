class ApplicationController < ActionController::Base
  def logout
    session[:user_name] = nil
    render("top/top")
  end
end
