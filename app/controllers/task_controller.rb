# encoding: utf-8

class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(name: params[:task_name], status_id: 1)
    @task.save
    redirect_to("/task/index")
  end
end
