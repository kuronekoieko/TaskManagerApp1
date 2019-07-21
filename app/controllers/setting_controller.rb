# encoding: utf-8

class SettingController < ApplicationController
  @@table_names = [
    "status",
    "priority",
    "pic",
    "classification",
  ]

  @@name_hush = {
    @@table_names[0] => "ステータス",
    @@table_names[1] => "優先度",
    @@table_names[2] => "担当者",
    @@table_names[3] => "分類",
  }

  def get_all_records(table_name)
    records_hush = {
      @@table_names[0] => Status.all,
      @@table_names[1] => Priority.all,
      @@table_names[2] => Pic.all,
      @@table_names[3] => Classification.all,
    }
    return records_hush[table_name]
  end

  def get_new_instance(table_name, record_name)
    case table_name
    when @@table_names[0]
      record = Status.new(name: record_name)
    when @@table_names[1]
      record = Priority.new(name: record_name)
    when @@table_names[2]
      record = Pic.new(name: record_name)
    when @@table_names[3]
      record = Classification.new(name: record_name)
    end
    return record
  end

  def setting
    @table_name = params[:table_name]
    @name = @@name_hush[@table_name]
    @records = get_all_records(@table_name)
  end

  def reset
    Task.find(1).destroy
    redirect_to("/setting/top")
  end

  def create_record
    @table_name = params[:table_name]
    @record = get_new_instance(@table_name, params[:record_name])
    @record.save

    redirect_to("/setting/setting/#{@table_name}")
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
    redirect_to("/setting/setting/#{@table_name}")
  end
end
