Rails.application.routes.draw do
  get "setting/setting/:table_name" => "setting#setting"
  post "setting/create_record/:table_name" => "setting#create_record"
  post "setting/delete_record/:table_name" => "setting#delete_record"

  get "task/top" => "task#top"
  get "task/index" => "task#index"
  get "task/show" => "task#show"
  post "task/create" => "task#create"
  post "task/delete" => "task#delete"
end
