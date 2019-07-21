# encoding: utf-8

class TaskController < ApplicationController
  def index
    @tasks = Task.all
    @pics = Pic.all

    @pics_hush = {}

    for pic in Pic.all
      @pics_hush[pic.name] = pic.id
    end
  end

  def create
    @task = Task.new(name: params[:task_name])
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

  def change
    task = Task.find_by(id: params[:task_id])
    task.update(pic_id: params[:pic_id])
    redirect_to("/task/index")
  end
end
