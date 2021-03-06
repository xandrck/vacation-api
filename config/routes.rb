Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # API Namespace
  namespace :v1 do
    resources :users, only: %i[index show]
    resources :vacations, only: :create
  end
end
