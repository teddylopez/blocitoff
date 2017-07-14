Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :todo_lists, only: [:create, :destroy, :show, :edit, :update, :new] do
      resources :items, only: [:create, :destroy] do
        member do
          patch :complete
        end
      end
    end
  end

  get "/users/:id/todo_lists/" => "todo_lists#new"
  get "/users/:id/todo_lists/:list_id" => "todo_lists#show"
  patch "/users/:id/todo_lists/:list_id" => "todo_lists#update"

  get "/users/:id/todo_lists/:list_id" => "todo_lists#edit"
  root to: "users#show"
end
