# encoding: utf-8

class TaskController < ApplicationController
  @@name_hush = {
    "status" => "ステータス",
    "priority" => "優先度",
    "pic" => "担当者",
    "classification" => "分類",
  }

  def get_all_records(table_name)
    records_hush = {
      "status" => Status.all,
      "priority" => Priority.all,
      "pic" => Pic.all,
      "classification" => Classification.all,
    }
    return records_hush[table_name]
  end

  def get_new_instance(table_name, record_name)
    case table_name
    when "status"
      record = Status.new(name: record_name)
    when "priority"
      record = Priority.new(name: record_name)
    when "pic"
      record = Pic.new(name: record_name)
    when "classification"
      record = Classification.new(name: record_name)
    end
    return record
  end

  def top
  end

  def index
    @tasks = Task.all
  end

  def setting
    @table_name = params[:table_name]
    @name = @@name_hush[@table_name]
    @records = get_all_records(@table_name)
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
    @record = get_new_instance(@table_name, params[:record_name])
    @record.save
    redirect_to("/task/setting/#{@table_name}")
  end

  def delete_record
    @table_name = params[:table_name]
    @records = get_all_records(@table_name)

    params[:deletelist].each do |di1, di2|
      puts di2
      if di2 == "1"
        @records.find_by(id: di1).delete
      end
    end
    redirect_to("/task/setting/#{@table_name}")
  end
end
