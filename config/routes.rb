Rails.application.routes.draw do
  # get 'todos/index'
  # get 'todos/new'
  # get 'todos/edit'
  # get 'todos/destroy'

  resources :todos
  root to: 'todos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
