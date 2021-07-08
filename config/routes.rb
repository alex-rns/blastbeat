# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'products#index', as: 'home'
  resources :products

  namespace 'api' do
    namespace 'v1' do
      resources :products
    end
  end
end
