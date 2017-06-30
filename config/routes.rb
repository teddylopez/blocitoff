Rails.application.routes.draw do
  devise_for :users
  resources :todo_lists
  resources :users, only: [:new, :create, :show]
  get 'welcome/index'
  get 'about' => 'welcome#about'

  root to: "users#show"
end
