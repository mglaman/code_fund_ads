# frozen_string_literal: true

Rails.application.routes.draw do
  resources :campaign_searches, only: [:create, :destroy]
  resources :property_searches, only: [:create, :destroy]
  resources :user_searches, only: [:create, :destroy]

  # polymorphic based on: app/models/concerns/imageable.rb
  scope "/imageables/:imageable_gid/" do
    resources :images, except: [:edit, :update]
  end

  resources :campaigns
  resources :creatives
  resources :distributions
  resources :impressions
  resources :invitations
  resources :properties
  resources :templates
  resources :themes
  resources :users

  scope "/users/:user_id" do
    resources :campaigns, only: [:index], as: :user_campaigns
    resources :properties, only: [:index], as: :user_properties
    resources :creatives, only: [:index], as: :user_creatives
  end

  root "users#index"
end
