Rails.application.routes.draw do
  devise_for :users
  root to: "schedules#index"
  get 'schedules/search'
  resources :schedules
end
