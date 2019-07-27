class TopController < ApplicationController
  def top
  end

  def login
    redirect_to("/task/index")
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
    )
    @user.save
    redirect_to("/top/top")
  end
end
