Rails.application.routes.draw do
  get 'post/show'
  get 'post/new'
  post 'post/create'
  get 'post/edit'
  get 'post/update'
  get 'post/delete'
  get 'post/index'
  get 'post/new'
  get 'post/create'
  get 'post/edit'
  get 'post/update'
  get 'post/delete'
  resources :users, only: [:new, :create]
  get '/', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
