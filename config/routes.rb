Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :posts, only: [:create, :update, :show, :destroy] do
        resources :likes, only: [:create, :destroy]
      end
    end
  end
   
end
