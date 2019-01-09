Rails.application.routes.draw do
  # get 'todos/index'
  # get 'todos/new'
  # get 'todos/edit'
  # get 'todos/destroy'

  resources :categories do
    resources :todos, only: [:create]
      get 'todos', to: 'todos#category_todo', as: :show_todos
  end
  
  resources :todos do
    member do
      patch :complete
    end
  end

  # patch '/todos/:id' => 'todos#complete', as: "complete"
  
  # post 'todos', to: 'todos#create_todo', as: :create_todo

  root to: 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
