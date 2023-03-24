Rails.application.routes.draw do
# ユーザー
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  scope module: "public" do
    root :to => "homes#top"
    get "about" => "homes#about"

    resources :posts, only: [:index, :create, :edit, :update, :destroy]
    resources :comments, only: [:index, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    root "homes#top"
    resources :kitchens, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :show, :edit, :update]
    resources :makers, only: [:index, :new, :create, :show, :edit, :update]
  end
end