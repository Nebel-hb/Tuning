Rails.application.routes.draw do

  # ========= 管理者(admin)のルーティング ================
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :orchestras, only: [:edit, :update, :index]
    # get '/' => 'orchestras#index', as: 'top'
  end
    post 'admin/users/:id' => 'admin/users#update'
  # ========= 利用者(user)のルーティング ================

  devise_for :users

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only: [:index, :show, :edit, :update]
    resources :orchestras, only: [:new, :create]
    resources :events, only: [:index, :show, :new, :edit, :update, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :tags, only: [:create, :destroy]
    resources :recruitments, only: [:index, :show, :new, :edit, :update, :create, :destroy]
    get 'recruitments/confirm/:id' => 'recruitments#confirm'
    resources :recruit_users, only: [:create, :index]
    resources :rooms, only: [:create, :index, :new]
    resources :chats, only: [:create, :index]
    resources :notifications, only: [:index]
    resources :activities, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

