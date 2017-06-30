Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:new, :create, :show] do
    resources :todo_lists
  end

  get 'todo_lists/new' => 'todo_lists#new'
  root to: "users#show"
end
