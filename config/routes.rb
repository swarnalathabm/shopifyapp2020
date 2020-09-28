Rails.application.routes.draw do
  resources :productlists
  get '/productlists', :to => 'productlists#index'
  resources :customerreviews do
    resources :customerreviewtags
  end
  resources :tagcreations do
  collection do 
    get :export
    post :import , only: %w(import), controller: "tagcreations"
  end
end


  get '/tagcreations', :to => 'tagcreations#index'
  get '/products', :to => 'products#index'
  root :to => 'home#index'

  resource :marketing_activities, only: [:create, :update] do
    patch :resume
    patch :pause
    patch :delete
    post :republish
    post :preload_form_data
    post :preview
    post :errors
  end
  mount ShopifyApp::Engine, at: '/'
# frozen_string_literal: true

namespace :app_proxy do
  root action: 'index'
  # simple routes without a specified controller will go to AppProxyController

  # more complex routes will go to controllers in the AppProxy namespace
  #   resources :reviews
  # GET /app_proxy/reviews will now be routed to
  # AppProxy::ReviewsController#index, for example
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
