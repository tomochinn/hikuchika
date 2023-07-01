Rails.application.routes.draw do
  
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/destroy'
  end
  namespace :admin do
    get 'recipes/show'
    get 'recipes/destroy'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'comments/new'
    get 'comments/create'
  end
  namespace :public do
    get 'favorites/index'
    get 'favorites/update'
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :public do
    get 'recipes/index'
    get 'recipes/new'
    get 'recipes/create'
    get 'recipes/show'
    get 'recipes/edit'
    get 'recipes/update'
    get 'recipes/destroy'
  end
  # ユーザー側
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  
  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  namespace :public do
    get 'checks/index'
    get 'checks/new'
    get 'checks/create'
    get 'checks/show'
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
