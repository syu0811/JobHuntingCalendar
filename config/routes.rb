Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :tops, only: [:index]
  resources :calendars, only: [:show]
  resources :companies, only: [:show, :new, :create, :destroy]
  resources :events, only: [:index, :new, :create, :destroy]

  root "tops#index"
end
