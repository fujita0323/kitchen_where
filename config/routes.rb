Rails.application.routes.draw do
  # ユーザー
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: "public" do
    root to: "homes#top"
    get "about" => "homes#about"
    get 'customers/information/edit' => "customers#edit"
    get 'customers/unsubscribe' => "customers#unsubscribe"
    patch 'customers/withdraw' => "customers#withdraw"
    get 'search' => 'kitchens#search'

    resources :customers, only: [:index, :show, :edit, :update]
    resources :kitchens, only: [:index, :create, :edit, :update, :show] do
      resources :posts do
        resources :comments, only: [:create, :new, :update, :destroy]
      end
    end
    # resources :posts do
    #   resources :comments, only: [:create, :new, :update, :destroy]
    # end
  end

  namespace :admin do
    root "homes#top"
    resources :kitchens
    resources :posts, only: [:destroy]
    resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :makers, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :customers, only: [:index, :new, :create, :edit, :update, :show]
  end
end
