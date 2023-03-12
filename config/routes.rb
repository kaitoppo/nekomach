Rails.application.routes.draw do

  #エンドユーザー側
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
    scope module: :public do
    get 'end_users/show'
    get 'end_users/edit'
    patch 'end_users/update'
  end
  
  
  #管理者側
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
end
