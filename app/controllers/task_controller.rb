# encoding: utf-8

class TaskController < ApplicationController
  protect_from_forgery

  def index
    @tasks = Task.all
    @pics_hush = {}
    for pic in Pic.all
      @pics_hush[pic.name] = pic.id
    end
    puts "いんでっくす"
  end

  def create
    puts "くりえいと"
    @task = Task.new(
      name: params[:task_name],
      pic_id: 1,
      status_id: 1,
      priority_id: 1,
      classification_id: 1,
    )
    @task.save
    redirect_to("/task/index")
  end

  def delete
    puts "でりーと"
    params[:deletelist].each do |di1, di2|
      puts di2
      if di2 == "1"
        Task.find_by(id: di1).delete
      end
    end

    redirect_to("/task/index")
  end

  def change
    puts "ああああああああああああああああああああああああ"
    task = Task.find_by(id: params[:task_id])
    # task.update(pic_id: params[:pic_id])
    task.pic_id = params[:pic_id]

    if task.save
      puts "保存成功！！！！！！！！"
    else
      puts "保存できない！！！！！！！！"
    end

    # puts task.name
    # puts "ああああああああああああああああああああああああ"
    redirect_to("/task/index")
  end
end
