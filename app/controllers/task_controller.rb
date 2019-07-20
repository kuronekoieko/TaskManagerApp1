# encoding: utf-8

class TaskController < ApplicationController
  def top
  end

  def index
    @tasks = Task.all
  end

  def setting
    @table_name = params[:table_name]
    case @table_name
    when "status"
      @records = Status.all
      @name = "ステータス"
    when "priority"
      @records = Priority.all
      @name = "優先度"
    when "pic"
      @records = Pic.all
      @name = "担当者"
    when "classification"
      @records = Classification.all
      @name = "分類"
    else
      @records = Status.all
      @name = "ステータス"
    end
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

  def create_record
    @table_name = params[:table_name]
    case @table_name
    when "status"
      @record = Status.new(name: params[:status_name])
    when "priority"
      @record = Priority.new(name: params[:status_name])
    when "pic"
      @record = Pic.new(name: params[:status_name])
    when "classification"
      @record = Classification.new(name: params[:status_name])
    else
    end
    @record.save
    redirect_to("/task/setting/#{@table_name}")
  end

  def delete_record
    puts @table_name
    params[:deletelist].each do |di1, di2|
      puts di2
      if di2 == "1"
        @status = Status.find_by(id: di1)
        @status.delete
      end
    end
    redirect_to("/task/setting/status")
  end
end
