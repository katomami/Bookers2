Rails.application.routes.draw do

  devise_for :users
  root to:'home#top'
  get "/home/about"=>"home#about"


 resources :users, only: [:show, :edit, :index, :new, :create, :update]
 resources :books
end