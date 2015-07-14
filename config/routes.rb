Rails.application.routes.draw do

  scope "(:locale)", :locale => /fr|en/ do
    root :to => 'packs#index'
    resources :packs, only: [:show, :index]
    resources :orders, only: [:new, :show, :create, :index] do
      collection do
        get :price
      end
    end
  end

  get '/login', to: 'admin/sessions#new'
  delete '/logout', to: 'admin/sessions#destroy'

  namespace :admin do
    root :to => 'packs#index'
    resources :orders
    resources :users, only: [:show, :edit, :update]
    resources :packs
    resources :sessions, only: [:new, :create]

  end

end
