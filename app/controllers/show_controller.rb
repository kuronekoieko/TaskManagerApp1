# encoding: utf-8
class ShowController < ApplicationController
  protect_from_forgery

  def get_hush(instances)
    hush = {}
    hush["未選択"] = 0
    for instance in instances
      hush[instance.name] = instance.id
    end
    return hush
  end

  def show
    @task = Task.find_by(id: params[:task_id])
    @pics_hush = get_hush(Pic.all)
    @statuses_hush = get_hush(Status.all)
    @priorities_hush = get_hush(Priority.all)
    @classifications_hush = get_hush(Classification.all)
  end

  def change
    task = Task.find_by(id: params[:task_id])
    task.update(
      pic_id: params[:pic_id],
      status_id: params[:status_id],
      priority_id: params[:priority_id],
      classification_id: params[:classification_id],
      comment: params[:comment],
    )
    redirect_to("/show/show/#{task.id}")
  end
end
