Rails.application.routes.draw do
  namespace :v1 do
    namespace :account do
      post 'login', to: 'sessions#create'
      post 'register', to: 'accounts#create'
    end
  end
end
