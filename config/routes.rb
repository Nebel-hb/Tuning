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


  # devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/orchestra_sign_in', to: 'users/sessions#new_orchestra'

  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only: [:index, :show, :edit, :update]
    resources :orchestras, only: [:new, :create]
    # patch 'events/:id', to: 'events#update',as: 'event'
    resources :events, only: [:index, :show, :new, :edit, :update, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :tags do
      get 'events', to: 'events#search',as: 'event_search'
    end
    get 'recruitments/confirm/:id' => 'recruitments#confirm', as: 'recruitments_confirm'
    resources :recruitments, only: [:index, :show, :new, :edit, :update, :create, :destroy]
    resources :recruit_users, only: [:create, :index, :destroy, :update]
    resources :recruit_instruments, only: [:create, :new, :index, :update]
    delete 'recruit_instruments/destroy_all' => 'recruit_instruments#destroy_all'
    delete 'recruit_instruments/:id' => 'recruit_instruments#destroy', as: 'destroy_recruit_instrument'
    resources :recruit_relations, only: [:create]
    resources :thank_you_comments, only: [:index, :create, :update]
    get 'thank_you_comment/:id' => 'thank_you_comments#thanks', as: 'thank_you_comment_thanks'
    resources :rooms, only: [:create, :index, :show ]
    get 'search' => 'rooms#search'
    resources :user_rooms, only: [:create, :update]
    resources :chats, only: [:create, :index]
    resources :notifications, only: [:index]
    resources :activities, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

