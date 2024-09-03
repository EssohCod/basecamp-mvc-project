Rails.application.routes.draw do
  devise_for :users
  
  resources :projects do
    resources :discussions, only: [:create, :index, :show, :new]
    resources :attachments, only: [:create, :destroy]
    member do
      get :remove_admin
      get :set_admin
    end
  end
  root 'projects#index'
end
