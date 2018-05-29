Rails.application.routes.draw do
  namespace :v1 do
    namespace :account do
      post 'login', to: 'sessions#create'
      post 'register', to: 'accounts#create'

      resource :v_codes, only: [:create]
    end
  end
end
