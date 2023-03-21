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
      get 'end_users/destroy_check' => "end_users#destroy_check"
      delete 'end_users/destroy' => "end_users#destroy"
      resources :post_machinekoes do
        resource :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :destroy]
      end
    end


  #管理者側
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
    namespace :admin do
      resources :post_machinekoes, only: [:index, :new, :create, :show, :edit]
      get 'post_machinekoes/matchineko_search'
    end
  end
