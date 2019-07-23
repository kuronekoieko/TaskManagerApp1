# encoding: utf-8
class ShowController < ApplicationController
  protect_from_forgery

  def show
    @task = Task.find_by(id: params[:task_id])
  end
end
