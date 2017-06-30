Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:new, :create, :show] do
    resources :todo_lists
  end

  root to: "users#show"
end
