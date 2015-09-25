Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'dashboard#index'

  resource :session, only: [:new, :create, :destroy] do
    collection do
      get :delete
      delete :delete, action: :destroy
    end
  end
  resources :users do
    member do
      get :delete
      delete :delete, action: :destroy
    end
  end

  resources :events do
    member do
      get :delete
      delete :delete, action: :destroy
    end
  end
  resources :updates do
    member do
      get :delete
      delete :delete, action: :destroy
    end
  end

  namespace :dashboard do
    get 'index'
    get 'about'
    get 'contact'
    get 'admin'
  end
end
