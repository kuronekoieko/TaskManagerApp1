# encoding: utf-8
class ShowController < ApplicationController
  protect_from_forgery

  def show
    @task = Task.find_by(id: params[:task_id])
    @pics_hush = {}
    for pic in Pic.all
      @pics_hush[pic.name] = pic.id
    end

    @statuses_hush = {}
    for status in Status.all
      @statuses_hush[status.name] = status.id
    end

    @priorities_hush = {}
    for priority in Priority.all
      @priorities_hush[priority.name] = priority.id
    end

    @classifications_hush = {}
    for classification in Classification.all
      @classifications_hush[classification.name] = classification.id
    end
  end

  def change
    task = Task.find_by(id: params[:task_id])
    task.update(
      pic_id: params[:pic_id],
      status_id: params[:status_id],
      priority_id: params[:priority_id],
      classification_id: params[:classification_id],
    )
    redirect_to("/show/show/#{task.id}")
  end
end
