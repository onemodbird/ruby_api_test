Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  root to: redirect('admin', status: 302)

  namespace :admin do
    resources :badges, only: [:index]
    get '/', to: 'dashboard#index'
    get '/search', to: 'search#index'
    get '/reports(/:action)', controller: 'reports'
    resources :users, except: [:destroy]
    resources :learning_registry_submissions, only: [:index, :update]
    resources :resources do
      resources :reviews
      member do
        match 'flags', via: [:put, :patch]
      end
    end
    resources :tag_groups, except: [:destroy]
    resources :search_configs, except: [:destroy]
    resources :search_queries, only: [:index]
    resources :suggested_searches, only: [:index] do
      collection do
        get 'edit'
        post 'edit', action: 'update'
      end
    end
    resources :articles, except: [:destroy] do
      post :publish, on: :member
    end
    resources :collection_groups, only: [:index, :create, :edit, :update]
    resources :featured_collection_groups, only: [:index, :create, :update, :destroy] do
      collection do
        post :reorder
      end
    end
    resources :chats, only: [:index, :create, :edit, :update] do
      member do
        put 'archive'
      end
    end
    resources :chat_promos, only: [:index, :create, :destroy] do
      collection do
        post :cancel_message
      end
    end
    resources :schedule_occurrence, only: [:update]
  end

  devise_for :users, :controllers => { confirmations: 'confirmations' }

  mount ApiManager => '/'

  mount GrapeSwaggerRails::Engine, at: "/v1/documentation" if Secrets.swagger

  authenticate :user, lambda { |u| u.superuser? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
