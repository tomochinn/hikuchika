Rails.application.routes.draw do


  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
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
    get 'users/:id/mypage' => 'users#show', as: 'user'
    get 'users/information/:id/edit' => 'users#edit', as: 'edit_user'
    patch 'users/:id/mypage' => 'users#update', as: 'update_user'
    resources :checks, only: [:index, :new, :create, :show]
    get 'recipes/:genre_id/search' => 'recipes#search', as: 'recipe_genre_search'
    get 'searches/search' => 'searches#search', as: 'search'
    resources :recipes do

      resources :comments, only: [:new, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
      get :favorites, on: :collection
    end

  end

  namespace :admin do
    root to: 'homes#top'
    resources :recipes, only: [:show, :destroy]
    resources :comments, only: [:index, :show, :destroy]
    resources :users, only: [:show]
    resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
