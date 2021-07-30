# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'products#index', as: 'home'

  resources :products, only: %i[index show]
  resources :payments, only: %i[new create]
  resources :subscriptions, only: %i[new create]

  post 'checkout/stripe_side_payment', to: 'checkout#stripe_side_payment'
  post 'checkout/create', to: 'checkout#create'
  get 'checkout/success', to: 'checkout#success'
  get 'checkout/cancel', to: 'checkout#cancel'

  namespace :api do
    namespace :v1 do
      resources :comments
      devise_for :users, singular: 'user', skip: %i[sessions registrations password]
      as :user do
        post 'users/sign_in', to: 'users/sessions#create'
      end
      resources :products
    end
  end
  namespace :backend do
    resources :products, except: %i[index show]
  end
end
