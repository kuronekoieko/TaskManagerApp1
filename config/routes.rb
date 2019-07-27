Rails.application.routes.draw do
  get "top/top"
  get "show/show"
  get "setting/setting/:table_name" => "setting#setting"
  post "setting/create_record/:table_name" => "setting#create_record"
  post "setting/delete_record/:table_name" => "setting#delete_record"

  get "task/top" => "task#top"
  get "task/index" => "task#index"
  get "task/show" => "task#show"
  post "task/create" => "task#create"
  post "task/delete" => "task#delete"

  get "show/show/:task_id" => "show#show"
  post "show/change/:task_id" => "show#change"

  get "top/top" => "top#top"
  post "top/login" => "top#login"
  post "top/create" => "top#create"

  post "logout" => "application#logout"
end
