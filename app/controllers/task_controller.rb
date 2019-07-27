# encoding: utf-8

class TaskController < ApplicationController
  before_action :forbid_login_user
  protect_from_forgery

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(
      name: params[:task_name],
    )
    @task.save
    redirect_to("/task/index")
  end

  def delete
    params[:deletelist].each do |di1, di2|
      puts di2
      if di2 == "1"
        Task.find_by(id: di1).delete
      end
    end
    redirect_to("/task/index")
  end
end
