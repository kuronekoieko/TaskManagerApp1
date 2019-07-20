class TaskController < ApplicationController
  def top
  end

  def index
    @tasks = Task.all
  end

  def setting
    @statuses = Status.all
  end

  def show
  end

  def create
    @task = Task.new(name: params[:task_name], status_id: 1)
    @task.save

    # @tasks = Task.all
    # @tasks.each do |task|
    # task.status_id=1
    # end
    # @tasks.save

    redirect_to("/task/index")
  end

  def reset
    Task.find(1).destroy
    redirect_to("/task/top")
  end

  def create_status
    @status = Status.new(name: params[:status_name])
    @status.save
    redirect_to("/task/setting")
  end
end
