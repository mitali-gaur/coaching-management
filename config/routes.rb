Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :coaches
  resources :coaches, only: :index

  resources :coaching_sessions, only: [] do
    collection do
      get :filter
    end
  end

  resources :companies, only: [:show] do
    member do
      devise_for :employees,
                 path_names: {
                   sign_in: 'sign_in',
                   sign_out: 'sign_out',
                   sign_up: 'sign_up'
                 },
                 controllers: {
                   registrations: 'employees/registrations',
                   sessions: 'employees/sessions'
                 }
    end
  end
end
