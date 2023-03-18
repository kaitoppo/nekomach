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
      resources :post_machinekoes
    end


  #管理者側
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

end
