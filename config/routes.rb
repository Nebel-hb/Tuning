Rails.application.routes.draw do
  
  # ========= 管理者(admin)のルーティング ================
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :orchestras, only: [:edit, :update]
    get '/' => 'orchestras#index', as: 'top'
  end
  
  # ========= 利用者(user)のルーティング ================
  
  devise_for :users, controllers: {
  sessions:      'sessions',
  passwords:     'passwords',
  registrations: 'registrations'
  }
  
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only: [:index, :show, :edit, :update]
    resources :orchestras, only: [:show, :create]
    resources :events, only: [:index, :show, :edit, :update, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :tags, only: [:create, :destroy]
    resources :recruitements, only: [:index, :show, :edit, :update, :create, :destroy, :confirm] 
    resources :recruit_users, only: [:create, :index]
    resources :rooms, only: [:create, :index, :new]
    resources :chats, only: [:create, :index]
    resources :notifications, only: [:index]
    resources :activities, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
