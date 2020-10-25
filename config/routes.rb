Rails.application.routes.draw do
  devise_for :users
  #get 'home/index'
  root 'home#index'
  get 'home/about'

  post "/" => 'home#index' #this is pointing the point to the controller, #our lookup will
  # our lookup will direct to the home#index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
