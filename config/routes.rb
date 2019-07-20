Rails.application.routes.draw do
  get "task/top" => "task#top"
  get "task/index" => "task#index"
  get "task/setting/:table_name" => "task#setting"
  get "task/show" => "task#show"

  post "task/create" => "task#create"
  post "task/reset" => "task#reset"
  post "task/create_record/:table_name" => "task#create_record"
  post "task/delete_record/:table_name" => "task#delete_record"
end
