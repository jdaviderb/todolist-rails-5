Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :tasks do 
    put 'done'
    put 'undone'
  end
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
