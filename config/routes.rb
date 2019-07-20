Rails.application.routes.draw do
  get "task/top" => "task#top"
  get "task/index" => "task#index"
  get "task/setting" => "task#setting"
  get "task/setting" => "task#show"

  post "task/create" => "task#create"
  post "task/reset" => "task#reset"
end
