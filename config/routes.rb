Rails.application.routes.draw do
  namespace :v1 do
    namespace :account do
      post 'login', to: 'sessions#create'
      post 'register', to: 'accounts#create'

      resource :v_codes, only: [:create]
      resource :verify_vcode, only: [:create]
      resource :reset_password, only: [:create]
      resources :users, only: [] do
        resource :profile, only: [:show, :update]
        resource :avatar, only: [:update]
        resource :change_password, only: [:create]
        resources :change_account, only: [:create]
        resources :bind_account, only: [:create]
      end
    end

    resources :users, module: :users, only: [] do
      member do
        get :profile
        get :topics
        get :activities
      end
      resources :followers, only: [:index, :destroy]
      resources :following, only: [:index, :create, :destroy] do
        get :uids, on: :collection
      end
      resources :likes, only: [:index, :create] do
        post :cancel, on: :collection
      end
    end

    # 说说或长帖
    resources :topics, only: [:index, :show, :create, :destroy] do
      post :image, on: :collection
      get :essence, on: :collection
    end

    # 活动
    resources :activities, only: [:index, :show, :create, :destroy] do
      post :image, on: :collection
      get :search, on: :collection
    end

    # 获取位置服务
    resources :locations, only: [:index]
  end
end
