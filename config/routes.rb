Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :todo_lists, only: [:create, :destroy, :show, :edit, :new] do
      resources :items, only: :create
    end
  end

  get "/users/:id/todo_lists/" => "todo_lists#new"
  get "/users/:id/todo_lists/:list_id" => "todo_lists#show"

  get "/users/:id/todo_lists/:list_id" => "todo_lists#edit"
  root to: "users#show"
end
