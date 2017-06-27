Rails.application.routes.draw do
  resources :todo_lists
  resources :users, only: [:new, :create, :show]
  get 'welcome/index'
  get 'about' => 'welcome#about'

  devise_for :users

  root to: "todo_lists#index"
end
