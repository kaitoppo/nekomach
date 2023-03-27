Rails.application.routes.draw do

  #エンドユーザー側
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
    scope module: :public do
      root to: "post_machinekoes#index"
      get 'post_machinekoes/map' => "post_machinekoes#map"
      get 'end_users/my_page' => "end_users#show"
      get 'end_users/information/edit' => "end_users#edit"
      patch 'end_users/information' => "end_users#update"
      get 'end_users/withdrawal_check' => "end_users#withdrawal_check"
      patch 'end_users/withdrawal' => "end_users#withdrawal"
      get 'favorites/my_favorites' => "favorites#index"
      resources :post_machinekoes do
        resource :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :destroy]
        collection do
          get 'search'
        end  
      end
    end


  #管理者側
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
    namespace :admin do
      root to: "end_users#index"
      resources :post_machinekoes, only: [:index, :new, :create, :show, :edit]
      resources :post_comments, only: [:index, :destroy]
      get 'post_machinekoes/matchineko_search'
      resources :end_users, only: [:index, :show, :edit, :update]
    end
  end
