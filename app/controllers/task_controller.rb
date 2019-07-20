class TaskController < ApplicationController
  def top
  end

  def index
    @tasks = Task.all
    @statuses = Status.all
  end

  def setting
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
    @tasks.save

    redirect_to("/task/index")
  end

  def reset
    Task.find(1).destroy
    redirect_to("/home/top")
  end
end
