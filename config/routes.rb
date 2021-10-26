Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'homes#top'

  get 'home/about' => 'homes#index'

  resources :users, only: [:show, :index, :new, :edit, :update]
  
  resources :books, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy] 
    resource :comments, only: [:create, :destroy]
  end
  
end
