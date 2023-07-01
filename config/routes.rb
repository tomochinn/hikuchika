Rails.application.routes.draw do
  
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  
  scope module: :public do
    get 'users/mypage' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/mypage' => 'users#update'
    resources :checks, only: [:index, :new, :create, :show]
    resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :favorites, only: [:index, :update, :create, :destroy]
    resources :comments, only: [:new, :create]
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :recipes, only: [:show, :destroy]
    resources :comments, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
 
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
