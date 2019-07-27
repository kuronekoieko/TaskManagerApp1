class TopController < ApplicationController
  def top
  end

  def login
    redirect_to("/task/index")
  end

  def create
    redirect_to("/top/top")
  end
end
