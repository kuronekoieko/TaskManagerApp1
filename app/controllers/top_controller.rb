class TopController < ApplicationController
  def top
  end

  def login
    @user_name = params[:name]
    @user_pass = params[:password]
    @user = User.find_by(
      name: @user_name,
      password: @user_pass,
    )
    if @user
      redirect_to("/task/index")
    else
      redirect_to("/top/top")
    end
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
