Rails.application.routes.draw do
  resources :todos do
    post '/sort', to: 'todos#sort', on: :collection
    post '/search', to: 'todos#search', on: :collection
    post '/edit_field', to: 'todos#edit_field', on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "todos#index"
end
